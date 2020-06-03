import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/http/HttpUrl.dart';
import 'package:wanflutter/model/ArticleModel.dart';
import 'package:wanflutter/ui/pages/webviewpage/WebViewPage.dart';
import 'package:wanflutter/utils/Dimens.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'package:wanflutter/utils/RouteUtil.dart';
import 'package:wanflutter/utils/ScreentUtil.dart';
import 'package:wanflutter/utils/StringUtil.dart';
import 'package:wanflutter/widget/LoadingWidget.dart';
import 'dart:convert';
import '../../model/BannerModel.dart';

/*
 * 首页
 */
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<Data> _listData = new List();
  List<Datas> _listArticle = new List();
  var page = 0;
  bool _isLoading = false; //是否加载更多
  ScrollController _scrollController = new ScrollController();
  Timer _timer;

  final _biggerFont = const TextStyle(fontSize: 14.0);
  final _textColor = const TextStyle(fontSize: 14.0, color: Colors.red);

  @override
  void initState() {
    print("init1");

    getBanner();
    getArticleData(page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!_isLoading) {
          _isLoading = true;
          page++;
          getArticleData(page);
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Column(
        children: _listData.length == 0
            ? [LoadingWidget()]
            : [
                Expanded(
                  child: Swiper(
                    ///banner
                    layout: SwiperLayout.DEFAULT,
                    pagination: new SwiperPagination(
                      //分页指示器
                      builder: SwiperPagination.dots,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 16, bottom: 16),
                    ),
                    itemCount: _listData.length,
                    autoplay: true,
                    itemHeight: Dimens.dp_300,
                    itemWidth: ScreenUtil.screenWidth(context),
                    itemBuilder: (BuildContext context, int index) {
                      Data dataBean = _listData[index];
                      return Image.network(dataBean.imagePath,
                          fit: BoxFit.cover);
                    },
                  ),
                  flex: 1,
                ),
                Expanded(child: _listView(), flex: 2)
              ],
      ),
    );
  }

  ///下拉刷新
  Future<Null> _refresh() async {
    page = 0;
    await Future.delayed(Duration(seconds: 1), () {
      getArticleData(page);
    });
  }

  Widget _listView() {
    return RefreshIndicator(
        color: Colors.blue,
        displacement: 40, //位移
        child: ListView.builder(
          itemCount: _listArticle.length,
          itemBuilder: (context, i) {
            return _itemBuild(_listArticle[i]);
          },
          controller: _scrollController,
        ),
        onRefresh: _refresh);
  }

  /// item
  Widget _itemBuild(Datas data) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StringUtil.replaceHtmlTag(data.title),
            style: _biggerFont,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
                data.shareUser.isEmpty ? data.author : data.shareUser,
                style: _textColor),
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
      onTap: () {
        RouteUtil.goPage(context, WebViewPage(data.link, data.title));
      },
    );
  }

  void getBanner() async {
    DioUtils.request(
      HttpUrl.BannerUrl,
      onSuccess: (data) {
        Map map = json.decode(data);
        BannerModel baseModel = BannerModel.fromJson(map);
        List<Data> list = baseModel.data;

        _timer = Timer(Duration(seconds: 2), () {
          _timer.cancel();
          setState(() {
            _listData = list;
          });
        });
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void getArticleData(int page) {
    DioUtils.request('article/list/$page/json', method: DioUtils.GET,
        onSuccess: (data) {
      Map map = json.decode(data);
      ArticleModel result = ArticleModel.fromJson(map);
      var listArticle = result.data.datas;
      setState(() {
        if (_isLoading) {
          _isLoading = false;
        }

        if (page == 0) {
          if (_listArticle.length > 0) {
            _listArticle.clear();
          }
        }

        if (_listArticle.length > 0) {
          _listArticle.addAll(listArticle);
        } else {
          _listArticle = listArticle;
        }
        print("_list---" + _listArticle.length.toString() + "");
      });
    }, onError: (error) {
      print(error);
    });
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/http/HttpUrl.dart';
import 'package:wanflutter/model/ArticleModel.dart';
import 'package:wanflutter/ui/login/LoginPage.dart';
import 'package:wanflutter/utils/Config.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'package:wanflutter/utils/RouteUtil.dart';
import 'dart:convert';
import '../../model/BannerModel.dart';

/*
 * 首页
 */
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> _listData = new List();
  List<Datas> _listArticle = new List();
  var page = 0;

  final _biggerFont = const TextStyle(fontSize: 14.0);
  final _textColor = const TextStyle(fontSize: 14.0, color: Colors.blue);

  @override
  void initState() {
    getBanner();
    getArticleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text("首页"),
        ),
      ),
      body: new Column(
        children: [
          new Swiper(
            ///banner
            layout: SwiperLayout.STACK,
            itemCount: _listData.length,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              Data dataBean = _listData[index];
              return new Image.network(dataBean.imagePath, fit: BoxFit.cover);
            },
            itemWidth: 400.0,
            itemHeight: 180.0,
          ),
          new Expanded(child: _listView())
//            _listView()
        ],
      ),
    );
  }

  Widget _listView() {
    return new ListView.builder(
//        padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
        itemCount: _listArticle.length,
        itemBuilder: (context, i) {
          return _itemBuild(_listArticle[i]);
        });
  }

  /// item
  Widget _itemBuild(Datas data) {
    return new ListTile(
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            data.title,
            style: _biggerFont,
          ),
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Text(data.shareUser, style: _textColor),
          ),
          new Divider(),
        ],
      ),
      onTap: () {
        print(data.title);
        RouteUtil.goPage(context, LoginPage());
//        RouteUtil.goPage(context, Config.LOGIN_PAGE);
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
        print(list.length);

        setState(() {
          _listData = list;
        });
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void getArticleData() {
    DioUtils.request('article/list/$page/json', method: DioUtils.GET,
        onSuccess: (data) {
      Map map = json.decode(data);
      ArticleModel result = ArticleModel.fromJson(map);
      var listArticle = result.data.datas;
      print(result.data.datas);
      setState(() {
        _listArticle = listArticle;
      });
    }, onError: (error) {
      print(error);
    });
  }
}

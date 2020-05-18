import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/http/HttpUrl.dart';
import 'package:wanflutter/model/ArticleModel.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'dart:convert';
import '../../model/BannerModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> listData = new List();
  var page = 0;

  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 14.0);
  final _line = const TextStyle(backgroundColor: Colors.black12);

  @override
  void initState() {
    getHttp();
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
            itemCount: listData.length,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              Data dataBean = listData[index];
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
        padding: const EdgeInsets.all(16.0),
        itemCount: listData.length,
        itemBuilder: (context, i) {
          return _itemBuild(listData[i]);
        });
  }

  /// item
  Widget _itemBuild(Data data) {
    return new ListTile(
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            data.title,
            style: _biggerFont,
          ),
          new Text(
            data.desc,
            style: _biggerFont,
          ),
          new Divider(),
        ],
      ),
      onTap: () {
        print(data.title);
      },
    );
  }

  void getHttp() async {
    DioUtils.postHttp(
      HttpUrl.BannerUrl,
      onSuccess: (data) {
        Map map = json.decode(data);
        BannerModel baseModel = BannerModel.fromJson(map);
        List<Data> list = baseModel.data;
        print(list.length);

        setState(() {
          listData = list;
        });
      },
      onError: (error) {
        print(error);
      },
    );
  }

  void getArticleData() {
    FormData formData = FormData.fromMap({'page': page});
    DioUtils.request(HttpUrl.ArticleUrl,
//        parameters: formData,
        method: DioUtils.GET,
        onSuccess: (data) {
          Map map = json.decode(data);
          ArticleModel result = ArticleModel.fromJson(map);
          print(result.data.datas);
        },
        onError: (error) {
          print(error);
        });
  }
}

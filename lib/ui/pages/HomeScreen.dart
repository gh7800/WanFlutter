import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'dart:convert';
import 'package:wanflutter/response/BaseResponse.dart';
import 'package:wanflutter/model/BannerModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    getHttp();
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
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Swiper(
              layout: SwiperLayout.STACK,
              itemCount: 4,
              autoplay: true,
              itemBuilder: (BuildContext context,int index){
                return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
              },
              itemWidth: 400.0,
              itemHeight: 150.0,
            ),
            listView()
          ],
        ),
      ),
    );
  }

  void getHttp() async {

    DioUtils.postHttp(
      "https://www.wanandroid.com/banner/json",
      onSuccess: (data) {
        Map map = json.decode(data);
        BaseResponse response = BaseResponse.fromMap(map);
        List list = response.data;

        var banner = list.first;
//        var title = banner.title;
        print(list.length);
      },
      onError: (error) {
        print(error);
      },
    );
  }
}

// ignore: camel_case_types
class listView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Text("data");
  }

}

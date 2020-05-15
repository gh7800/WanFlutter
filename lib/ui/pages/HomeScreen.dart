import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'dart:convert';
import '../../model/BannerModel.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Data> listData = new List();

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
              itemCount: listData.length,
              autoplay: true,
              itemBuilder: (BuildContext context,int index){
//                DateBean dataBean = listData[index];
                return new Image.network(listData[index].imagePath,fit: BoxFit.cover);
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
}

// ignore: camel_case_types
class listView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Text("data");
  }

}

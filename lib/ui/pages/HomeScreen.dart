import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'dart:convert';
import 'package:wanflutter/response/BannerResponse.dart';
import 'package:wanflutter/response/BaseResponse.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Data> listData = new List();
  @override
  void initState() {
    getHttp();
//    List<BannerModel> list;
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
//                DateBean dataBean = listData[index];
                return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover);
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


//        BannerResponse res = BannerResponse.fromJson(data);
//        List<Data> list = res.data;
//        setState(() {
//          listData = list;
//        });

        BaseResponse baseResponse = BaseResponse.fromJson(map);
        print(baseResponse.data);

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

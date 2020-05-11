import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/Utils/LogUtil.dart';
import 'package:wanflutter/ui/tab/BottomNavigationWidget.dart';
import 'package:wanflutter/utils/Util.dart';

/// 首页
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
//    return new Text("Home");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("homeTitle"),
      ),
      body: new Center(
        child: new BottomNavigationWidget(),
//        child: new RaisedButton(
//          onPressed: () => LogUtil.e("ccccxxx"),
//          child: new Image.asset(Util.getImgPath("icon_flutter")),
//        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/utils/Config.dart';
import 'package:wanflutter/utils/RouteUtil.dart';
import 'package:wanflutter/utils/ImageUtil.dart';

/// 闪屏页

///倒计时
var n = 1;

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    _cutDown();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtil.getImgPath("splash_bg"),
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  //倒计时
  void _cutDown() {
    timer = Timer(new Duration(seconds: n),
        () => {RouteUtil.goPageReplace(context, Config.routeMain)});
  }
}

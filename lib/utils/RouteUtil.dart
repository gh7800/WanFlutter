import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanflutter/utils/Config.dart';

/*
 *路由-页面跳转
 */
class RouteUtil {
  //去首页
  static void goMain(BuildContext context) {
    goPageReplace(context, Config.routeMain);
  }

  /*static void goPage(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }*/

  static void goPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  //跳转并替换
  static void goPageReplace(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }

  //退出当前页面，返回到上一级页面
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}

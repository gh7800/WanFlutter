import 'package:flutter/widgets.dart';
import 'package:wanflutter/utils/Config.dart';

class RouteUtil {

  static void goMain(BuildContext context) {
    goPageReplace(context, Config.routeMain);
  }

  static void goPage(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }

  static void goPageReplace(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }
}
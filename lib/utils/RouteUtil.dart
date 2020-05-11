import 'package:flutter/widgets.dart';

class RouteUtil {

  static void goPage(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }

  static void goPageReplace(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }
}
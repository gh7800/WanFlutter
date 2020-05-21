import 'package:flutter/cupertino.dart';

/// 屏幕尺寸工具
class ScreenUtil {
 static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

 static double screenHeight(BuildContext context) {
   return MediaQuery.of(context).size.height;
 }
}
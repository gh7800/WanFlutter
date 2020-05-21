import 'package:flutter/cupertino.dart';

/// 键盘
class HideKeybordSoft {

  static hideKeybord(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

}
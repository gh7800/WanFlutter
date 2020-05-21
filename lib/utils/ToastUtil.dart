import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast
class ToastUtil {

  static toast(String msg){
    Fluttertoast.showToast(msg: msg,textColor: Colors.white,backgroundColor: Colors.grey);
  }

  static showToast(String str,Toast length,ToastGravity toastGravity,Color color,Color bgColor){
    Fluttertoast.showToast(msg: str,toastLength: length,gravity: toastGravity,textColor: color,backgroundColor: bgColor);
  }

}
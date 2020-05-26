import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanflutter/model/UserModel.dart';
import 'package:wanflutter/utils/Config.dart';
import 'package:wanflutter/utils/Dimens.dart';
import 'package:wanflutter/utils/DioUtil.dart';
import 'package:wanflutter/utils/HideKeybordSoft.dart';
import 'package:wanflutter/utils/ImageUtil.dart';
import 'package:wanflutter/utils/RouteUtil.dart';
import 'package:wanflutter/utils/ScreentUtil.dart';
import 'package:wanflutter/utils/SharePreferenceUtil.dart';
import 'package:wanflutter/utils/StringRes.dart';
import 'package:wanflutter/utils/ToastUtil.dart';

/*
 * 登录页
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  _saveUser(User user) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Config.USERNAME, user.username);
    preferences.setString(Config.USER_PUBLIC_NAME, user.publicName);
    preferences.setInt(Config.USER_ID, user.id);
    
    print('username-----------'+preferences.get(Config.USERNAME));
    
    RouteUtil.goBack(context);
  }

  @override
  Widget build(BuildContext context) {
    print(ScreenUtil.screenWidth(context));
    print(ScreenUtil.screenHeight(context));
    return Scaffold(
      appBar: AppBar(
        title: new Text(StringRes.login),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ImageUtil.getImgPath("icon_flutter"),
            width: 80.0,
            height: 80.0,
            fit: BoxFit.fill,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 50.0),
            margin: EdgeInsets.fromLTRB(16.0, 87.0, 16.0, 16.0),
            child: TextField(
//              keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: '请输入账号..',
                  suffixIcon: Icon(Icons.cancel),
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.all(1.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey))),
              onChanged: (text) {
                this.username = text;
                print(text); //输入的账号
              },
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 50.0),
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true, //填充
                contentPadding: EdgeInsets.all(1.0),//内间距
                suffixIcon: Icon(Icons.email),
                fillColor: Colors.white,
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.enhanced_encryption),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,  //隐藏输入
              onChanged: (text) {
                this.password = text;
                print(text); //输入密码
              },
              onSubmitted: (text) {
                print(text); //点击回车
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimens.dp_16, right: Dimens.dp_16),
            child: RaisedButton(
              highlightColor: Colors.blueAccent,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: 48.0, maxWidth: ScreenUtil.screenWidth(context)),
                alignment: Alignment.center,
                child: new Text(StringRes.login,
                    style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                if (username.isEmpty) {
                  ToastUtil.toast('请输入账号');
                  return;
                } else if (password.isEmpty) {
                  ToastUtil.toast('请输入密码');
                  return;
                }
                HideKeybordSoft.hideKeybord(context);

                FormData fromData = FormData.fromMap(
                    {'username': username, 'password': password});
                DioUtils.postHttp('user/login', parameters: fromData,
                    onSuccess: (data) {
                  Map map = json.decode(data);
                  UserModel userModel = UserModel.fromJson(map);
                  if(userModel.errorCode == 0){
                    ToastUtil.toast('登录成功');
                    User user = userModel.data;
                    _saveUser(user);
                  }else{
                    ToastUtil.toast(userModel.errorMsg);
                  }
                }, onError: (error) {
                  Fluttertoast.showToast(msg: error);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

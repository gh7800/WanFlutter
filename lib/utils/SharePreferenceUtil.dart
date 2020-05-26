/*
 * SharePreference
 * 数据保存工具
 */
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtil{

    static put(String key,String value) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(key, value);
    }

    static get(String key) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String str =  sharedPreferences.getString(key);
     return str;
    }
}
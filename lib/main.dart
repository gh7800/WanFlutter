import 'package:flutter/material.dart';
import 'package:wanflutter/ui/SplashScreen.dart';
import 'package:wanflutter/ui/tab/BottomNavigationWidget.dart';
import 'package:wanflutter/utils/Config.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {Config.routeMain: (context) => new BottomNavigationWidget()},
      title: 'WanAndroid_Flutter',
      home: SplashScreen(),
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
    );
  }
}

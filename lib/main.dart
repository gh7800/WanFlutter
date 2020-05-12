import 'package:flutter/material.dart';
import 'package:wanflutter/ui/SplashScreen.dart';
import 'package:wanflutter/ui/tab/BottomNavigationWidget.dart';
import 'package:wanflutter/utils/Config.dart';

void main() => runApp(new MyApp());

var n = 1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {Config.routeMain: (context) => new BottomNavigationWidget()},
      title: 'Welcome to Flutter',
      home: SplashScreen(),
      debugShowCheckedModeBanner: true,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:wanflutter/UI/Home.dart';
import 'package:wanflutter/ui/tab/BottomNavigationWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  get builder => null;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: BottomNavigationWidget(),//https://github.com/BBNO/flutter_bottom_navigation
      debugShowCheckedModeBanner: true,
      /*home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
//          child: new Text('Hello World'),
//          child: new Image.asset("assets/images/icon_flutter.png"),
          child: new RaisedButton(
            child: new Image.asset("assets/images/icon_flutter.png"),
            onPressed: () => Navigator.push(context,new MaterialPageRoute(builder: (context)=>new Home())),
        ),
      ),
      ),*/
    );
  }
}

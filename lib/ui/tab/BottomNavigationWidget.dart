import 'package:flutter/material.dart';
import 'package:wanflutter/ui/pages/HomeScreen.dart';
import 'package:wanflutter/ui/pages/KnowledgeScreen.dart';
import 'package:wanflutter/ui/pages/ProjectScreen.dart';
import 'package:wanflutter/ui/pages/SquareScreen.dart';

/// 底部导航菜单
class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;

  List<Widget> list = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //脚手架
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _bottomNavigationColor),
                title: Text("首页",
                    style: TextStyle(
                      color: _bottomNavigationColor,
                    ))),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps, color: _bottomNavigationColor),
                title: Text("项目",
                    style: TextStyle(
                      color: _bottomNavigationColor,
                    ))),
            BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_hide, color: _bottomNavigationColor),
                title: Text("体系",
                    style: TextStyle(
                      color: _bottomNavigationColor,
                    ))),
            BottomNavigationBarItem(
                icon: Icon(Icons.crop_square, color: _bottomNavigationColor),
                title: Text("广场",
                    style: TextStyle(
                      color: _bottomNavigationColor,
                    ))),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(ProjectScreen())
      ..add(KnowledgeScreen())
      ..add(SquareScreen());
    super.initState();
  }
}

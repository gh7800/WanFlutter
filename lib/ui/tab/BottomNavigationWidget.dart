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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> list = List();
  List<String> titleList = ['首页', '项目', '体系', '广场'];
  int _currentIndex = 0;

  List<BottomNavigationBarItem> itemList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("项目")),
    BottomNavigationBarItem(icon: Icon(Icons.dehaze), title: Text("体系")),
    BottomNavigationBarItem(icon: Icon(Icons.crop_square), title: Text("广场"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(  //抽屉
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: Border(

                  )
                ),
                child: Text("text"),
              ),
              Text("收藏"),
              Text("积分"),
              Text("每日一问"),
              Text("登录"),
              Text("夜间"),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(titleList[_currentIndex]),
          centerTitle: true,
          leading: RaisedButton(
            child: Icon(
              Icons.line_weight,
              color: Colors.white,
            ),
            color: Colors.redAccent,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer(); //打开左侧菜单
            },
          ),
        ),
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: itemList,
          //item
          unselectedItemColor: Colors.grey,
          //未选中时的颜色
          selectedItemColor: Colors.deepOrangeAccent,
          //选中时的颜色
          type: BottomNavigationBarType.fixed,
          //固定类型
          currentIndex: _currentIndex,
          //当前位置
          onTap: (int index) {
            //点击事件
            if (_currentIndex != index) {
              setState(() {
                _currentIndex = index;
              });
            }
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

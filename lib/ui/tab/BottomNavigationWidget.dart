import 'package:flutter/material.dart';
import 'package:wanflutter/ui/pages/HomeScreen.dart';
import 'package:wanflutter/ui/pages/KnowledgeScreen.dart';
import 'package:wanflutter/ui/pages/ProjectScreen.dart';
import 'package:wanflutter/ui/pages/SquareScreen.dart';
import 'package:wanflutter/ui/pages/login/LoginPage.dart';
import 'package:wanflutter/utils/RouteUtil.dart';

/// 底部导航菜单
class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> _children = [
    HomeScreen(),
    ProjectScreen(),
    KnowledgeScreen(),
    SquareScreen()
  ];
  List<String> titleList = ['首页', '项目', '体系', '广场'];
  int _currentIndex = 0;
  TabController _controller;

  List<BottomNavigationBarItem> itemList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("项目")),
    BottomNavigationBarItem(icon: Icon(Icons.dehaze), title: Text("体系")),
    BottomNavigationBarItem(icon: Icon(Icons.crop_square), title: Text("广场"))
  ];

  _drawerText(String title, IconData iconData, Widget page, String integral) {
    return RaisedButton(
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.redAccent,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(title),
              ),
              flex: 1,
            ),
            Container(
              child: Text(
                integral,
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(shape: BoxShape.rectangle),
            ),
          ],
        ),
        onPressed: () {
          RouteUtil.goPage(context, page);
        });
  }

  @override
  void initState() {
    _controller = TabController(vsync: this,length: _children.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          //抽屉
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.redAccent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wifi_tethering,
                        size: 56.0,
                        color: Colors.black,
                      ),
                      Text(
                        "username",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                          child: Text("ID"), margin: EdgeInsets.only(top: 10)),
                    ],
                  )),
              _drawerText("收藏", Icons.add_box, LoginPage(), ""),
              _drawerText("积分", Icons.graphic_eq, LoginPage(), "201"),
              _drawerText("每日一问", Icons.work, LoginPage(), ""),
              _drawerText("登录", Icons.flight_takeoff, LoginPage(), ""),
              _drawerText("夜间", Icons.update, LoginPage(), ""),
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
//        body: _children[_currentIndex],
        body: TabBarView(
//          index: _currentIndex,
          children: _children,
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10.0,
          //item
          items: itemList,
          //未选中时的颜色
          unselectedItemColor: Colors.grey,
          //选中时的颜色
          selectedItemColor: Colors.deepOrangeAccent,
          //固定类型
          type: BottomNavigationBarType.fixed,
          //当前位置
          currentIndex: _currentIndex,
          //点击事件
          onTap: (int index) {
            if (_currentIndex != index) {
              setState(() {
                _currentIndex = index;
              });
              _controller.animateTo(index);
            }
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

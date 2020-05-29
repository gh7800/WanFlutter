import 'package:flutter/cupertino.dart';
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

  _drawerText(String title, Widget page) {
    return RaisedButton(
        child: Row(
          children: <Widget>[
          Icon(Icons.loyalty,color: Colors.redAccent,),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(title),
            ),
            flex: 1,
          ),
          Container(child: Text("0000",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Colors.redAccent,shape: BoxShape.rectangle),),
        ],),
        onPressed: () {
          RouteUtil.goPage(context, page);
        });
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
                  decoration:
                      BoxDecoration(color: Colors.redAccent),
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
              _drawerText("收藏", LoginPage()),
              _drawerText("积分", LoginPage()),
              _drawerText("每日一问", LoginPage()),
              _drawerText("登录", LoginPage()),
              _drawerText("夜间", LoginPage()),
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

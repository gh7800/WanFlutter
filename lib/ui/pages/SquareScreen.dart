import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///广场
class SquareScreen extends StatefulWidget {
  @override
  _SquareScreenState createState() => _SquareScreenState();
}

class _SquareScreenState extends State<SquareScreen> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
    print("init4");

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Material(
//        child: Text("广场"),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,//主轴方向
                crossAxisAlignment: CrossAxisAlignment.start,//次轴方向
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            new Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            new Text('45'),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    print('init2');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("build2");
    return Scaffold(
      body: Center(
        child: Text("项目"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';

class KnowledgeScreen extends StatefulWidget {
  @override
  _KnowledgeScreenState createState() => _KnowledgeScreenState();
}

class _KnowledgeScreenState extends State<KnowledgeScreen>with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print('init3');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Center(
        child: Text("体系"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';

class KnowledgeScreen extends StatefulWidget {
  @override
  _KnowledgeScreenState createState() => _KnowledgeScreenState();
}

class _KnowledgeScreenState extends State<KnowledgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("体系"),
        ),
      ),
      body: Center(
        child: Text("体系"),
      ),
    );
  }
}

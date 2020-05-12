import 'package:flutter/material.dart';

class SquareScreen extends StatefulWidget {
  @override
  _SquareScreenState createState() => _SquareScreenState();
}

class _SquareScreenState extends State<SquareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("广场"),
        ),
      ),
      body: Center(
        child: Text("广场"),
      ),
    );
  }
}

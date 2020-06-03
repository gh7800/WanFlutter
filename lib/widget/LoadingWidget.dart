import 'package:flutter/material.dart';
import 'package:wanflutter/utils/Dimens.dart';

///loading圆圈
class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Dimens.dp_40,
        height: Dimens.dp_40,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

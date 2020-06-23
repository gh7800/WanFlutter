import 'package:flutter/material.dart';
import 'package:wanflutter/utils/Dimens.dart';

///loading圆圈
class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 500.0,
      child: SizedBox(
        width: Dimens.dp_25,
        height: Dimens.dp_25,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

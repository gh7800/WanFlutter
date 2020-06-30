import 'package:flutter/material.dart';
import 'package:wanflutter/utils/Dimens.dart';

///loading圆圈
class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    /*return Center(
      child: Container(
        width: Dimens.dp_30,
        height: Dimens.dp_30,
        child: SizedBox(
          child: CircularProgressIndicator(strokeWidth: Dimens.dp_3),
        ),
      ),
    );*/
    return Center(
      child: SizedBox(
        width: Dimens.dp_30,
        height: Dimens.dp_30,
        child: CircularProgressIndicator(strokeWidth: Dimens.dp_3),
      ),
    );
  }
}

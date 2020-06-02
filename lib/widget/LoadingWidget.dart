import 'package:flutter/material.dart';
import 'package:wanflutter/utils/Dimens.dart';

class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: Dimens.dp_40,height: Dimens.dp_40,child: CircularProgressIndicator(),)
      ],
    );
  }
}

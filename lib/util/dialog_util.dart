import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

showToast(String text,BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Text(text),
      );
    },
  );
}
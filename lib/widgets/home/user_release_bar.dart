import 'package:flutter/material.dart';

class UserReleaseBar extends StatefulWidget {
  @override
  UserReleaseBarState createState() {
    return UserReleaseBarState();
  }
}

class UserReleaseBarState extends State<UserReleaseBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.new_releases),
                Text(
                  '这就去发布'
                ),
              ],
            )
          ),
        ),
        //最重要的发布产品按钮区域
      ],
    );
  }
}
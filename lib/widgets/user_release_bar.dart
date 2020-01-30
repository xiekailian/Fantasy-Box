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
        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
              ),
              Text(
                'User Place...........'
              ),
            ],
          ),
        ),//用户登录信息区域
        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
              ),
              Text(
                'Release Place'
              ),
            ],
          )
        )//最重要的发布产品按钮区域
      ],
    );
  }
}
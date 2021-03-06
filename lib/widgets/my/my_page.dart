import 'package:flutter/material.dart';
import '../common/navigator_bar.dart';
import './header_place.dart';
import './body_place.dart';

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: navigatorBar(context,title: '个人中心'),
      body:Column(
        children: <Widget>[
          HeaderPlace(),
          Expanded(
            child: BodyPlace(),
          )
        ],
      ), 
    );
  }

}


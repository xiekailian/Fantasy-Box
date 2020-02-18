import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

class MyPageWebview extends StatefulWidget {
  @override
  _MyPageWebviewState createState() => _MyPageWebviewState();
}

class _MyPageWebviewState extends State<MyPageWebview> {
  String url = 'assets/my_page.html';
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Live View'),
      ),
      body: EasyWebView(
        src: url,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val) {
          if (mounted)
            setState(() {
              url = _getUrl(val);
              _currentIndex = val;
            });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Flutter'),
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            title: Text('Dart'),
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }

  String _getUrl(int val) {
    switch (val) {
      case 0:
        return 'https://flutter.dev';
      case 1:
        return 'https://dart.dev';
      default:
        return 'https://google.com';
    }
  }
}
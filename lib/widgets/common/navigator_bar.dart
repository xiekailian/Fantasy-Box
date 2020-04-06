import 'package:fantasy_box/widgets/login/login_page.dart';
import 'package:flutter/material.dart';
import '../search/search_page.dart';
import '../product/detail.dart';
import '../my/my_page.dart';

TextEditingController searchController = TextEditingController();
navigatorBar(BuildContext context, {String title='Fantasy Box', VoidCallback onPressed}){
  void _search([String str]) {
    print(searchController.text);
    Navigator.push( context,
      MaterialPageRoute(builder: (context) {
        return SearchPage();
    }));
  }

  void _pushToProduct() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Detail();
        },
      ),
    );
  }
  
  return AppBar(
    title: Container(
        // margin: EdgeInsets.fromLTRB(20.0, 0, 100.0, 0),
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
        child: Listener(
          child: CircleAvatar(
            backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
          ),
          onPointerUp: (PointerUpEvent event){
            // Navigator.push( context,
            //   MaterialPageRoute(builder: (context) {
            //     return MyPage();
            // }));
            Navigator.push( context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
            }));
          },
        ),
      ),
    actions: <Widget>[
      new IconButton(icon: new Icon(Icons.list), onPressed: _pushToProduct),
      Container(
        width: 180.0,
        padding: EdgeInsets.all(5.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(8.0),
            icon: Icon(Icons.phone),
            labelText: '输入搜索内容',
          ),
          // onSubmitted: _search,
        ),
      ),
      Container(
        width: 30.0,
        // margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
        child: FlatButton(
          onPressed: _search,
          padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          child: Icon(Icons.search)
        ),
      ),
    ],
  );
}
import 'package:flutter/material.dart';
import '../home/home_swiper.dart';
import '../product/detail.dart';

TextEditingController searchController = TextEditingController();
navigatorBar(BuildContext context, {String title='Fantasy Box', VoidCallback onPressed}){
  void _search([String str]) {
    print(searchController.text);
    Navigator.push( context,
      MaterialPageRoute(builder: (context) {
        return HomeSwiper();
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
    // Here we take the value from the MyHomePage object that was created by
    // the App.build method, and use it to set our appbar title.
    title: Text(title),
    actions: <Widget>[
      new IconButton(icon: new Icon(Icons.list), onPressed: _pushToProduct),
      Container(
        width: 400.0,
        padding: EdgeInsets.all(8.0),
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
            labelText: '请输入你的用户名)',
          ),
          // onSubmitted: _search,
        ),
      ),
      Container(
        width: 40.0,
        child: FlatButton(
          onPressed: _search,
          padding: EdgeInsets.all(0.0),
          child: Icon(Icons.search)
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 0, 100.0, 0),
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
        child: Listener(
          child: CircleAvatar(
            backgroundImage: NetworkImage('http://via.placeholder.com/350x150'),
          ),
          onPointerUp: (PointerUpEvent event){
            Navigator.push( context,
              MaterialPageRoute(builder: (context) {
                return HomeSwiper();
            }));
          },
        ),
      ),
    ],
  );
}
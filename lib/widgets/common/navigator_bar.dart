import 'package:fantasy_box/controller/productController.dart';
import 'package:fantasy_box/models/index.dart';
import 'package:fantasy_box/widgets/common/provider/changeNotifierProvider.dart';
import 'package:fantasy_box/widgets/common/provider/userModel.dart';
import 'package:fantasy_box/widgets/login/login_page.dart';
import 'package:flutter/material.dart';
import '../search/search_page.dart';
import '../product/detail.dart';
import '../my/my_page.dart';

TextEditingController searchController = TextEditingController();
navigatorBar(BuildContext context, {String title='Fantasy Box', VoidCallback onPressed}){
  Product product;
  List productContentList;
  User user = ChangeNotifierProvider.of<UserModel>(context).user;
  Future<void> _search([String str]) async {
    product = await ProductController().search(keywords: searchController.text);
    productContentList = product.data;
    print(productContentList);
    Navigator.push( context,
      MaterialPageRoute(builder: (context) {
        return SearchPage(productContentList);
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
            backgroundImage: NetworkImage(user!=null?user.avatarUrl:'http://via.placeholder.com/350x150'),
          ),
          onPointerUp: (PointerUpEvent event){
            if(ChangeNotifierProvider.of<UserModel>(context).isLogin){
              Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                  return MyPage();
              }));
            }else{
              Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
              }));
            }
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
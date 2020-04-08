import 'dart:convert';

import 'package:fantasy_box/controller/productController.dart';
import 'package:fantasy_box/models/index.dart';
import 'package:fantasy_box/util/dialog_util.dart';
import 'package:fantasy_box/widgets/common/itemsBuilder.dart';
import 'package:flutter/material.dart';
import 'home_swiper.dart';
import '../../mock/home_mock.dart';

class HomeDisplay extends StatefulWidget {
  @override
  HomeDisplayState createState() {
    return HomeDisplayState();
  }
}

class HomeDisplayState extends State<HomeDisplay> with TickerProviderStateMixin {
  TabController _tabController;
  List productList = typeList;
  Product product;

  @override
  void initState() {
    super.initState();
    // getAllProductList();
  }

  // void getAllProductList() async {
  //   Product product;
  //   try {
  //     product = await ProductController().getAllProductList();
      
  //     setState(() {
  //       productList = product.data;
  //       print('ffffffffffffff');
  //       productList.forEach((element) {
  //         if(element['content']==null){
  //           element['content'] = [];
  //         }
  //         for (var item in element['content']) {
  //           if(item['imgUrl']==null){
  //             setState(() {
  //               // item['imgUrl'] = 'http://via.placeholder.com/150x150';
  //             });
  //             // item['imgUrl'] = 'http://via.placeholder.com/150x150';
  //             print('----------------------'+item['name']);
  //           }
  //         }
  //       });
  //       print('xxxxxxxxx');
  //       print(productList);
  //     });
  //   } catch (e) {
  //     //登录失败则提示
  //     showToast(e.toString());
  //   }
  // }

  Future<Product> getAllProductListFuture() async {
    Product product;
    try {
      product = await ProductController().getAllProductList();
      
      // setState(() {
        // productList = product.data;
        // print('ffffffffffffff');
        // productList.forEach((element) {
        //   for (var item in element['content']) {
        //     if(item['imgUrl']==null){
        //       setState(() {
        //         // item['imgUrl'] = 'http://via.placeholder.com/150x150';
        //       });
        //       // item['imgUrl'] = 'http://via.placeholder.com/150x150';
        //       print('----------------------'+item['name']);
        //     }
        //   }
        // });
        // print('xxxxxxxxx');
        // print(productList);
        // productList.forEach((element) {
        //   for (var item in element['content']) {
        //     print('----------------------'+item['imgUrl']);
        //   }
        // });
      // });
    } catch (e) {
      //登录失败则提示
      showToast(e.toString(),context);
    }
  }

    @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ProductController().getAllProductList(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              product = snapshot.data;
              productList = product.data;
              productList = productList.sublist(0,4);
              _tabController = TabController(length: productList.length, vsync: this);
              productList.forEach((element) {
                if(element['content']==null){
                  element['content'] = [];
                }
                for (var item in element['content']) {
                  if(item['imgUrl']==null){
                    item['imgUrl'] = 'http://via.placeholder.com/350x150';
                  }
                }
              });
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: TabBar(   //生成Tab菜单
                      indicatorColor: Colors.yellow,
                      controller: _tabController,
                      tabs: productList.map((e) => Tab(text: e['name'])).toList()
                    ),
                  ),
                  Container(
                    height: 700.0,
                    color: Colors.white,
                    child: TabBarView(
                      controller: _tabController,
                      children: productList.map((e) { //创建4个Tab页
                        // print(json.decode(e['content']));
                        return Container(
                          // alignment: Alignment.center,
                          // height: 100.0,
                          // width: 100.0,
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            children: buildContentItems(context,e['content']),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              );
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Container(
  //           color: Colors.white,
  //           child: TabBar(   //生成Tab菜单
  //             indicatorColor: Colors.yellow,
  //             controller: _tabController,
  //             tabs: productList.map((e) => Tab(text: e['name'])).toList()
  //           ),
  //         ),
  //         Container(
  //           height: 400.0,
  //           color: Colors.white,
  //           child: TabBarView(
  //             controller: _tabController,
  //             children: productList.map((e) { //创建4个Tab页
  //               print('------------------------render');
  //               return Container(
  //                 // alignment: Alignment.center,
  //                 // height: 100.0,
  //                 // width: 100.0,
  //                 child: Wrap(
  //                   alignment: WrapAlignment.spaceAround,
  //                   children: buildContentItems(context,e['content']),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         )
  //       ],
  //     )
  //   );
  // }
}
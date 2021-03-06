
import 'package:dio/dio.dart';
import 'package:fantasy_box/models/index.dart';
import 'dart:async';

import 'package:fantasy_box/widgets/common/global.dart';

class ProductController {
  static Dio dio = new Dio(BaseOptions(
    baseUrl: Global.baseUrl,
  ));

  // 登录接口，登录成功后返回用户信息
  Future<Product> getAllProductList([int hotNum]) async {
    var r = await dio.get(
      "/api/product/all-list",
    );
    // print(r.data);
    return Product.fromJson(r.data);
  }

  Future<Product> search({String keywords = ''}) async {
    var r = await dio.get(
      "/api/product/search",
      queryParameters:{"keywords":keywords}
    );
    // print(r.data);
    return Product.fromJson(r.data);
  }
}
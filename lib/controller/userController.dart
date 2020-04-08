
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fantasy_box/models/user.dart';
import 'dart:async';

import 'package:fantasy_box/widgets/common/global.dart';

class UserController {
  static Dio dio = new Dio(BaseOptions(
    baseUrl: Global.baseUrl,
  ));

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String username, String password) async {
    // List<Cookie> cookies = [
    //   new Cookie("SESSION", '123'),
    //   // ....
    // ];
    // Cookie.fromSetCookieValue('');
    // Global.cookieJar.saveFromResponse(Uri.parse(Global.baseUrl+"/api/user/login"), cookies);
    FormData formData = new FormData.fromMap({
      "username": username,
      "password": password,
    });
    // dio.interceptors.add(CookieManager(Global.cookieJar));
    var r = await dio.post(
      "/api/user/login",
      data: formData
    );
    // print(r.headers);
    // print(Global.cookieJar.loadForRequest(Uri.parse(Global.baseUrl+"/api/user/login")));
    if(r.data['code']=='418'){
      return null;
    }
    return User.fromJson(r.data['data']);
  }
}

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fantasy_box/models/user.dart';
import 'dart:async';

class UserController {
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
  ));

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String username, String password) async {
    FormData formData = new FormData.fromMap({
      "username": username,
      "password": password,
    });
    var r = await dio.post(
      "/api/user/login",
      data: formData
    );
    dio.interceptors.add(CookieManager(CookieJar()));
    print(r.data);
    if(r.data['code']=='418'){
      return null;
    }
    return User.fromJson(r.data['data']);
  }
}

import 'dart:html';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fantasy_box/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/adapter.dart';

class UserController {
  UserController([this.context]){

  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  // 登录接口，登录成功后返回用户信息
Future<User> login(String username, String password) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print('xxx');
    var r = await dio.post(
      "/api/user/login",
      data: {
        'username':username,
        'password':password
      }
      // options: _options.merge(headers: {
      //   HttpHeaders.authorizationHeader: basic
      // }, extra: {
      //   "noCache": true, //本接口禁用缓存
      // }),
    );
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    // dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    // //清空所有缓存
    // Global.netCache.cache.clear();
    // //更新profile中的token信息
    // Global.profile.token = basic;
    print('fuck');
    print(r.data);
    return User.fromJson(r.data);
  }
}
import 'package:fantasy_box/models/index.dart';
import 'package:fantasy_box/widgets/common/provider/profileChangeNotifier.dart';
// import 'package:flutter/material.dart';

class UserModel extends ProfileChangeNotifier {
  User get user => profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User user) {
    // profile.lastLogin = profile.user?.login;
    profile.user = user;
    notifyListeners();
  }
}
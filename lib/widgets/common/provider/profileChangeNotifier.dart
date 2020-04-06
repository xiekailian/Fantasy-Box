import 'package:fantasy_box/models/profile.dart';
import 'package:fantasy_box/widgets/common/global.dart';
import 'package:flutter/material.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  // Profile _profile;
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;
  void setIsLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/auth_api_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApiService _userService = AuthApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> register(UserModel user) async {
    _setLoading(true);
    final success = await _userService.register(user);
    _setLoading(false);
    return success;
  }

  Future<bool> login(UserModel user) async {
    _setLoading(true);
    final success = await _userService.login(user);
    _setLoading(false);
    return success;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
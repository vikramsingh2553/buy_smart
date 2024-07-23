import 'package:buy_smart/auth/model/auth_model.dart';
import 'package:buy_smart/auth/service/auth_api_service.dart';
import 'package:flutter/material.dart';



class AuthProvider extends ChangeNotifier {
  final AuthApiService _userService = AuthApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>?> register(AuthModel user) async {
    _setLoading(true);
    final success = await _userService.register(user);
    _setLoading(false);
    return success;
  }

  Future<Map<String, dynamic>?> login(AuthModel user) async {
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

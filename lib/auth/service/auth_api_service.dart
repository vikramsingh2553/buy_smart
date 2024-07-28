import 'dart:convert';
import 'package:buy_smart/auth/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  final String baseUrl = 'http://localhost:3000/api';

  Future<Map<String, dynamic>?> login(AuthModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toMap()),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(AuthModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to register: ${response.statusCode}');
      return null;
    }
  }
}
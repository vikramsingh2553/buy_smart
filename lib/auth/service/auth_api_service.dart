import 'package:buy_smart/auth/model/user_model.dart';
import 'package:buy_smart/product/shared/api_endpoints.dart';
import 'package:http/http.dart' as http;



class AuthApiService {
  Future<bool> register(UserModel user) async {
    final url = Uri.parse('${ApiEndpoints}/register');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(UserModel user) async {
    final url = Uri.parse('${ApiEndpoints}/login');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

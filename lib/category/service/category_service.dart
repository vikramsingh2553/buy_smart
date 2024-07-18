import 'dart:convert';
import 'package:buy_smart/category/model/category_model.dart';
import 'package:buy_smart/product/shared/api_endpoints.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.category),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<CategoryModel> categories = data.map((item) => CategoryModel.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

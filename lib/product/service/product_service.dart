import 'dart:convert';
import 'package:buy_smart/product/model/product_model.dart';
import 'package:buy_smart/product/shared/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<ProductModel> products = data.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductModel>> fetchFavorites() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.product),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<ProductModel> favorites = data.map((item) => ProductModel.fromJson(item)).toList();
      return favorites;
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  Future<bool> addToFavorites(String productId) async {
    final response = await http.post(
      Uri.parse('${ApiEndpoints.product}/$productId'),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
      },
    );

    return response.statusCode == 200;
  }

  Future<bool> removeFromFavorites(String productId) async {
    final response = await http.delete(
      Uri.parse('${ApiEndpoints.product}/$productId'),
      headers: {
        'Authorization': 'Bearer ${ApiEndpoints.authToken}',
      },
    );

    return response.statusCode == 200;
  }
}

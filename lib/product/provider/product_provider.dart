import 'package:flutter/material.dart';
import 'package:buy_smart/product/model/product_model.dart';
import 'package:buy_smart/product/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  List<ProductModel> _favorites = [];
  bool _isLoading = true;

  List<ProductModel> get products => _products;
  List<ProductModel> get favorites => _favorites;
  bool get isLoading => _isLoading;

  ProductProvider() {
    fetchProducts();
    fetchFavorites();
  }

  Future<void> fetchProducts() async {
    try {
      _products = await _productService.fetchProducts();

    } catch (e) {
     return;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchFavorites() async {
    try {
      _favorites = await _productService.fetchFavorites();
    } catch (e) {
      return;
    } finally {
      notifyListeners();
    }
  }

  Future<void> addToFavorites(ProductModel product) async {
    try {
      bool success = await _productService.addToFavorites(product.id);
      if (success) {
        _favorites.add(product);
        notifyListeners();
      }
    } catch (e) {
      return;
    }
  }

  Future<void> removeFromFavorites(ProductModel product) async {
    try {
      bool success = await _productService.removeFromFavorites(product.id);
      if (success) {
        _favorites.removeWhere((item) => item.id == product.id);

        notifyListeners();
      }
    } catch (e) {
      return;
    }
  }

  bool isFavorite(ProductModel product) {
    return _favorites.any((item) => item.id == product.id);
  }

  void incrementCount(ProductModel product) {
    product.clickCount++;
    notifyListeners();
  }
}

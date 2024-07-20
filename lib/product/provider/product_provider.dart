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
      print('Products loaded: ${_products.length}');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchFavorites() async {
    try {
      _favorites = await _productService.fetchFavorites();
      print('Favorites loaded: ${_favorites.length}');
    } catch (e) {
      print('Error fetching favorites: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> addToFavorites(ProductModel product) async {
    try {
      bool success = await _productService.addToFavorites(product.id);
      if (success) {
        _favorites.add(product);
        print('Added to favorites: ${product.name}');
        notifyListeners();
      }
    } catch (e) {
      print('Error adding to favorites: $e');
    }
  }

  Future<void> removeFromFavorites(ProductModel product) async {
    try {
      bool success = await _productService.removeFromFavorites(product.id);
      if (success) {
        _favorites.removeWhere((item) => item.id == product.id);
        print('Removed from favorites: ${product.name}');
        notifyListeners();
      }
    } catch (e) {
      print('Error removing from favorites: $e');
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

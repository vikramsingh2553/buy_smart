import 'package:flutter/material.dart';
import 'package:buy_smart/product/model/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> cartItemsList = [];

  List<ProductModel> get cartItems => cartItemsList;

  void addToCart(ProductModel product) {
    cartItemsList.add(product);
    notifyListeners();
  }

  void deleteCartProduct(ProductModel product) {
    cartItemsList.remove(product);
    notifyListeners();
  }

  double get totalPrice =>
      cartItemsList.fold(0.0, (sum, item) => sum + item.price);
}

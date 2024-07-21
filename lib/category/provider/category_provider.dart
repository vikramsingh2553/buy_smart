import 'package:flutter/material.dart';
import 'package:buy_smart/category/service/category_service.dart';
import 'package:buy_smart/category/model/category_model.dart';
import 'package:flutter/scheduler.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  final CategoryService _categoryService = CategoryService();

  Future<void> fetchCategories() async {
    if (_isLoading) return;

    _isLoading = true;
    _notifyListenersSafely();

    try {
      _categories = await _categoryService.fetchCategories();
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      _notifyListenersSafely();
    }
  }

  void _notifyListenersSafely() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (hasListeners) {
        notifyListeners();
      }
    });
  }
}

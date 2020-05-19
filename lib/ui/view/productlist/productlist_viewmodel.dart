import 'package:flutter/foundation.dart';
import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class ProductListViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  int i = 0;
  List<ProductModel> _products;

  List<ProductModel> get products => _products;

  getProductListForCategory(CategoryModel category) {
    print(category.name);
    while (i < Hive.box('products').length) {
      ProductModel productModel = Hive.box('products').get(i);
      if (productModel.categoryId == category.id) {
        _products.add(productModel);
        notifyListeners();
      }
      i++;
      print('$i - ${_products.length}');
    }
  }
}

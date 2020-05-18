import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();

  List<CategoryModel> get categories => _apiService.categories;

  ProductModel getProduct(String id) {
    // return categories.
  }
}

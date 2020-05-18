import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';

class MostSharedViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  List<ProductModel> get mostSharedProducts => _apiService.mostSharedProducts;
}

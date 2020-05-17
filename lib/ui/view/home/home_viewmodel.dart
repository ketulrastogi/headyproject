import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  String _title = "Home Page";
  String get title => _title;

  List<Category> get categories => _apiService.categories;
}

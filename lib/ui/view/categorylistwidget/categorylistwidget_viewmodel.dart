import 'package:headyproject/app/locator.dart';
import 'package:headyproject/app/router.gr.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryListWidgetViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();
  CategoryModel _category;
  List<CategoryModel> get categories => _apiService.categories;

  navigateToAllCategoryPage() {
    _navigationService.navigateTo(Routes.categoryListView);
  }

  navigateToProductListPage(CategoryModel category) {
    _navigationService.navigateTo(Routes.productListView, arguments: category);
  }
}

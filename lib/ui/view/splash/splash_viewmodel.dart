import 'package:headyproject/app/locator.dart';
import 'package:headyproject/app/router.gr.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();

  fetchData() async {
    await _apiService.fetchData();
    // notifyListeners();
    print('Data Loaded Using Splash Screen');
    _navigationService.navigateTo(Routes.homeView);

    // print('Total Categories : ${_apiService.categories.length}');
  }
}

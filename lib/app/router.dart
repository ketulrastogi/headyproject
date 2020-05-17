import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:headyproject/ui/view/categorylist/categorylist_view.dart';
import 'package:headyproject/ui/view/home/home_view.dart';
import 'package:headyproject/ui/view/productlist/productlist_view.dart';
import 'package:headyproject/ui/view/splash/splash_view.dart';
import 'package:headyproject/ui/view/subcategorylist/subcategorylist_view.dart';

// Defining routes and global transitions
@CustomAutoRouter(
    transitionsBuilder: TransitionsBuilders.zoomIn, durationInMilliseconds: 400)
class $Router {
  @initial
  SplashView splashView;

  HomeView homeView;

  CategoryListView categoryListView;

  SubCategoryListView subCategoryListView;

  ProductListView productListView;
}

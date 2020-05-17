// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:headyproject/ui/view/splash/splash_view.dart';
import 'package:headyproject/ui/view/home/home_view.dart';
import 'package:headyproject/ui/view/categorylist/categorylist_view.dart';
import 'package:headyproject/ui/view/subcategorylist/subcategorylist_view.dart';
import 'package:headyproject/ui/view/productlist/productlist_view.dart';

abstract class Routes {
  static const splashView = '/';
  static const homeView = '/home-view';
  static const categoryListView = '/category-list-view';
  static const subCategoryListView = '/sub-category-list-view';
  static const productListView = '/product-list-view';
  static const all = {
    splashView,
    homeView,
    categoryListView,
    subCategoryListView,
    productListView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => SplashView(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.homeView:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.categoryListView:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CategoryListView(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.subCategoryListView:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SubCategoryListView(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.productListView:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductListView(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 400),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

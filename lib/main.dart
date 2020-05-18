import 'package:flutter/material.dart';
import 'package:headyproject/app/locator.dart';
import 'package:headyproject/app/router.gr.dart';
import 'package:headyproject/ui/view/home/home_view.dart';
import 'package:headyproject/ui/view/splash/splash_view.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heady Shop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.splashView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:headyproject/app/locator.dart';
import 'package:headyproject/app/router.gr.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/models/variant_model.dart';
import 'package:headyproject/ui/view/home/home_view.dart';
import 'package:headyproject/ui/view/splash/splash_view.dart';
import 'package:hive/hive.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(VariantModelAdapter());
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heady Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.splashView,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}

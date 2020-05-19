import 'dart:convert';

import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/models/variant_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:observable_ish/value/value.dart';

class ApiService with ReactiveServiceMixin {
  http.Client _client = http.Client();
  RxValue<List<CategoryModel>> _categories =
      RxValue<List<CategoryModel>>(initial: []);
  RxValue<List<ProductModel>> _products =
      RxValue<List<ProductModel>>(initial: []);
  RxValue<List<CategoryModel>> _newCategories =
      RxValue<List<CategoryModel>>(initial: []);
  RxValue<List<ProductModel>> _newProducts =
      RxValue<List<ProductModel>>(initial: []);
  RxValue<List<ProductModel>> _mostOrderedProducts =
      RxValue<List<ProductModel>>(initial: []);
  RxValue<List<ProductModel>> _mostViewedProducts =
      RxValue<List<ProductModel>>(initial: []);
  RxValue<List<ProductModel>> _mostSharedProducts =
      RxValue<List<ProductModel>>(initial: []);
  RxValue<List<VariantModel>> _variants =
      RxValue<List<VariantModel>>(initial: []);

  List<CategoryModel> get categories => _categories.value;
  List<ProductModel> get products => _products.value;
  List<CategoryModel> get newCategories => _newCategories.value;
  List<ProductModel> get newProducts => _newProducts.value;

  List<VariantModel> get variants => _variants.value;

  List<ProductModel> get mostOrderedProducts => _mostOrderedProducts.value;
  List<ProductModel> get mostViewedProducts => _mostViewedProducts.value;
  List<ProductModel> get mostSharedProducts => _mostSharedProducts.value;

  String _url = 'https://stark-spire-93433.herokuapp.com/json';

  checkLocalData() async {
    final categoriesBox = await Hive.openBox('categories');
    final productsBox = await Hive.openBox('products');
    final variantsBox = await Hive.openBox('variants');
    final localDataBox = await Hive.openBox('localData');
    final mostOrderedBox = await Hive.openBox('mostOrdered');
    final mostViewedBox = await Hive.openBox('mostViewed');
    final mostSharedBox = await Hive.openBox('mostShared');
    bool value = localDataBox.get(0) as bool;
    print('LocalDataBoxValue : $value');
    if (value == null && !value) {
      await fetchData();
    }
  }

  fetchData() async {
    final categoriesBox = await Hive.openBox('categories');
    final productsBox = await Hive.openBox('products');
    final variantsBox = await Hive.openBox('variants');
    final localDataBox = await Hive.openBox('localData');
    final mostOrderedBox = await Hive.openBox('mostOrdered');
    final mostViewedBox = await Hive.openBox('mostViewed');
    final mostSharedBox = await Hive.openBox('mostShared');

    http.Response _response = await _client.get(_url);

    Map<String, dynamic> body = json.decode(_response.body);
    print('Recieved data from api');

    // Save categories in _categories variable
    _categories.value = (body['categories'] as List)
        .map((category) => CategoryModel.fromMap(category))
        .toList();

    // Save Products in _products variable
    body['categories'].forEach((category) {
      _newCategories.value.add(CategoryModel.fromMap(category));
      category['products'].forEach((product) {
        ProductModel productModel = ProductModel.fromMap(product);
        productModel.categoryId = category['id'];
        productModel.taxName = product['tax']['name'];
        productModel.taxValue =
            double.parse(product['tax']['value'].toString());
        productModel.childCategories = product['child_categories'];
        _newProducts.value.add(productModel);

        // Save Variants
        product['variants'].forEach((variant) {
          VariantModel variantModel = VariantModel.fromMap(variant);
          variantModel.setProductId(product['id']);
          _variants.value.add(variantModel);
        });
      });
    });

    // Update View Counts in Products
    body['rankings'][0]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      productModel.setViewCount(product['view_count']);
    });

    // Update Order Counts in Products
    body['rankings'][1]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      productModel.setOrderCount(product['order_count']);
    });

    // Update Share Counts in Products
    body['rankings'][2]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      productModel.setShareCount(product['shares']);
    });

    // List Most Ordered Products
    newProducts.forEach((element) {
      if (element.orderCount != null) {
        _mostOrderedProducts.value.add(element);
      }
    });

    // List Most Viewed Products
    _newProducts.value.forEach((element) {
      if (element.viewCount != null) {
        _mostViewedProducts.value.add(element);
      }
    });

    // List Most Shared Products
    _newProducts.value.forEach((element) {
      if (element.sharedCount != null) {
        _mostSharedProducts.value.add(element);
      }
    });

    categoriesBox.addAll(_categories.value);
    productsBox.addAll(_products.value);
    variantsBox.addAll(_variants.value);
    print('Products Length: ${_products.value.length}');
    mostOrderedBox.addAll(_mostOrderedProducts.value);
    mostViewedBox.addAll(_mostViewedProducts.value);
    mostSharedBox.addAll(_mostSharedProducts.value);

    localDataBox.add(true);
  }
}

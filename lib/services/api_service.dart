import 'dart:convert';

import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
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

  List<CategoryModel> get categories => _categories.value;
  List<ProductModel> get products => _products.value;
  List<CategoryModel> get newCategories => _newCategories.value;
  List<ProductModel> get newProducts => _newProducts.value;

  List<ProductModel> get mostOrderedProducts => _mostOrderedProducts.value;
  List<ProductModel> get mostViewedProducts => _mostViewedProducts.value;
  List<ProductModel> get mostSharedProducts => _mostSharedProducts.value;

  String _url = 'https://stark-spire-93433.herokuapp.com/json';

  fetchData() async {
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
      });
    });

    // Update Order, Shared and Viewed Counts

    body['rankings'][0]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      // productModel.viewCount = product['view_count'];

      productModel.setViewCount(product['view_count']);
    });

    body['rankings'][1]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      // productModel.viewCount = product['view_count'];

      productModel.setOrderCount(product['order_count']);
    });

    body['rankings'][2]['products'].forEach((product) {
      ProductModel productModel =
          _newProducts.value.firstWhere((item) => (item.id == product['id']));
      // productModel.viewCount = product['view_count'];

      productModel.setShareCount(product['shares']);
    });

    getMostOrderedProducts();
    getMostViewedProducts();
    getMostSharedProducts();

    // print(
    //     'Categories : ${newCategories.length}, Products: ${newProducts.length}');
  }

  getMostOrderedProducts() {
    newProducts.forEach((element) {
      if (element.orderCount != null) {
        _mostOrderedProducts.value.add(element);
      }
    });
    // print('NewProducts: ${newProducts.length}');
    // print('Total : $i');
    print('MostOrdered: ${mostOrderedProducts.length}');
  }

  getMostViewedProducts() {
    _newProducts.value.forEach((element) {
      if (element.viewCount != null) {
        _mostViewedProducts.value.add(element);
      }
    });
    print('MostViewed: ${mostViewedProducts.length}');
  }

  getMostSharedProducts() {
    _newProducts.value.forEach((element) {
      if (element.sharedCount != null) {
        _mostSharedProducts.value.add(element);
      }
    });
    // print(
    //     'Sample : ${newProducts.map((e) => (e.orderCount == null)).toList().length}');
    print('MostShared: ${mostSharedProducts.length}');
  }
}

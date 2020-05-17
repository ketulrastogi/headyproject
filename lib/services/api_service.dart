import 'dart:convert';

import 'package:headyproject/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:observable_ish/value/value.dart';

class ApiService with ReactiveServiceMixin {
  http.Client _client = http.Client();
  RxValue<List<Category>> _categories = RxValue<List<Category>>(initial: []);

  List<Category> get categories => _categories.value;
  String _url = 'https://stark-spire-93433.herokuapp.com/json';

  fetchData() async {
    http.Response _response = await _client.get(_url);

    Map<String, dynamic> body = json.decode(_response.body);
    print('Recieved data from api');
    print(body['categories'][0]['products'][0]);
    _categories.value = (body['categories'] as List)
        .map((category) => Category.fromMap(category))
        .toList();
    print(_categories.value.length);
    print('mapped it to models');
  }
}

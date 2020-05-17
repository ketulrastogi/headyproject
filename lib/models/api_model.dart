import 'package:headyproject/models/category_model.dart';

class ApiModel {
  final int id;
  final String name;
  final List<Category> categories;

  ApiModel({this.id, this.name, this.categories});

  factory ApiModel.fromMap(Map<String, dynamic> data) {
    return ApiModel(
      id: data['id'],
      name: data['name'],
      categories: (data['categories'] as List)
          .map((category) => Category.fromMap(category))
          .toList(),
    );
  }
}

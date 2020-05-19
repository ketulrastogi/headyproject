import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List childCategories;

  CategoryModel({this.id, this.name, this.childCategories});

  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id'],
      name: data['name'],
      childCategories: data['child_categories'],
    );
  }
}

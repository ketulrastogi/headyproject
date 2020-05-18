class CategoryModel {
  final int id;
  final String name;
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

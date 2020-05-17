import 'package:headyproject/models/product_model.dart';

class Category {
  final int id;
  final String name;
  final List<Product> products;
  final List<int> childCategories;

  Category({
    this.id,
    this.name,
    this.products,
    this.childCategories,
  });

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['name'],
      products: (data['products'] as List)
          .map((product) => Product.fromMap(product))
          .toList(),
      // childCategories: data['child_categories'],
    );
  }
}

class Product {
  int id;
  String name;
  DateTime dateAdded;
  List<Varient> varients;
  Tax tax;
  List<int> childCategories;
  // int orderCount;
  // int viewCount;
  // int sharedCount;

  Product({
    this.id,
    this.name,
    this.dateAdded,
    this.varients,
    this.tax,
    this.childCategories,
    // this.orderCount,
    // this.sharedCount,
    // this.viewCount,
  });

  // setOrderCount(int orderCount) {
  //   this.orderCount = orderCount;
  // }

  // setViewCount(int viewCount) {
  //   this.viewCount = viewCount;
  // }

  // setShareCount(int sharedCount) {
  //   this.sharedCount = sharedCount;
  // }

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'],
      dateAdded: DateTime.parse(data['date_added']),
      varients: (data.containsKey('varients') && data['verients'] != null)
          ? (data['varients'] as List)
              .map((varient) => Varient.fromMap(varient))
              .toList()
          : [],
      tax: Tax.fromMap(data['tax']),
      childCategories: data['child_categories'],
    );
  }
}

class Varient {
  int id;
  String color;
  int size;
  int price;

  Varient({this.id, this.color, this.size, this.price});

  factory Varient.fromMap(Map<String, dynamic> data) {
    return Varient(
      id: data['id'],
      color: data['color'],
      size: data['size'],
      price: data['price'],
    );
  }
}

class Tax {
  String name;
  double value;

  Tax({this.name, this.value});

  factory Tax.fromMap(Map<String, dynamic> data) {
    return Tax(
      name: data['name'],
      value: double.parse(data['value'].toString()),
    );
  }
}

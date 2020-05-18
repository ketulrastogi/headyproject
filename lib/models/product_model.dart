class ProductModel {
  int id;
  String name;
  DateTime dateAdded;
  int categoryId;
  List<int> childCategories;
  int orderCount;
  int viewCount;
  int sharedCount;
  String taxName;
  double taxValue;

  ProductModel({
    this.id,
    this.name,
    this.dateAdded,
    this.categoryId,
    this.childCategories,
    this.orderCount,
    this.sharedCount,
    this.viewCount,
    this.taxName,
    this.taxValue,
  });

  setCategoryId(int categoryId) {
    this.categoryId = categoryId;
  }

  setOrderCount(int orderCount) {
    this.orderCount = orderCount;
  }

  setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  setShareCount(int sharedCount) {
    this.sharedCount = sharedCount;
  }

  setTaxName(String name) {
    this.taxName = name;
  }

  setTaxValue(double value) {
    this.taxValue = value;
  }

  setChildCategories(List<int> data) {
    this.childCategories = data;
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      name: data['name'],
      dateAdded: DateTime.parse(data['date_added']),
      categoryId:
          (data.containsKey('category_id') && data['category_id'] != null)
              ? data['category_id']
              : null,
      childCategories: data['child_categories'],
      orderCount:
          (data.containsKey('order_count') && data['order_count'] != null)
              ? data['order_count']
              : null,
      viewCount: (data.containsKey('view_count') && data['view_count'] != null)
          ? data['view_count']
          : null,
      sharedCount: (data.containsKey('shares') && data['shares'] != null)
          ? data['shares']
          : null,
      taxName: (data.containsKey('tax_name') && data['tax_name'] != null)
          ? data['tax_name']
          : null,
      taxValue: (data.containsKey('tax_value') && data['tax_value'] != null)
          ? data['tax_value']
          : null,
    );
  }
}

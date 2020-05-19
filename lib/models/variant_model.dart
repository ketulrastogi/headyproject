class VariantModel {
  int id;
  String color;
  int size;
  int price;
  int productId;

  setProductId(int productId) {
    this.productId = productId;
  }

  VariantModel({this.id, this.color, this.size, this.price, this.productId});

  factory VariantModel.fromMap(Map<String, dynamic> data) {
    return VariantModel(
      id: data['id'],
      color: data['color'],
      price: data['price'],
      size: data['size'],
    );
  }
}

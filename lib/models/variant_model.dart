import 'package:hive/hive.dart';

part 'variant_model.g.dart';

@HiveType(typeId: 2)
class VariantModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String color;
  @HiveField(2)
  int size;
  @HiveField(3)
  int price;
  @HiveField(4)
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

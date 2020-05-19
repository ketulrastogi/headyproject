// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      name: fields[1] as String,
      dateAdded: fields[2] as DateTime,
      categoryId: fields[3] as int,
      childCategories: (fields[4] as List)?.cast<int>(),
      orderCount: fields[5] as int,
      sharedCount: fields[7] as int,
      viewCount: fields[6] as int,
      taxName: fields[8] as String,
      taxValue: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dateAdded)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.childCategories)
      ..writeByte(5)
      ..write(obj.orderCount)
      ..writeByte(6)
      ..write(obj.viewCount)
      ..writeByte(7)
      ..write(obj.sharedCount)
      ..writeByte(8)
      ..write(obj.taxName)
      ..writeByte(9)
      ..write(obj.taxValue);
  }
}

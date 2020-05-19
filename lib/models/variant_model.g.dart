// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantModelAdapter extends TypeAdapter<VariantModel> {
  @override
  final typeId = 2;

  @override
  VariantModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantModel(
      id: fields[0] as int,
      color: fields[1] as String,
      size: fields[2] as int,
      price: fields[3] as int,
      productId: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VariantModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.productId);
  }
}

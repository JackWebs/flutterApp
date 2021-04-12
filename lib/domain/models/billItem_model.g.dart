// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billItem_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillItemModelAdapter extends TypeAdapter<BillItemModel> {
  @override
  final int typeId = 1;

  @override
  BillItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillItemModel(
      fields[0] as double,
      fields[1] as SplitType,
      (fields[2] as HiveList).castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, BillItemModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.cost)
      ..writeByte(1)
      ..write(obj.splitType)
      ..writeByte(2)
      ..write(obj.billItemSplits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

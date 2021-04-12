// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billItemSplit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillItemSplitModelAdapter extends TypeAdapter<BillItemSplitModel> {
  @override
  final int typeId = 2;

  @override
  BillItemSplitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillItemSplitModel(
      fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BillItemSplitModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillItemSplitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

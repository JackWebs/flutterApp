// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billSplit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillSplitModelAdapter extends TypeAdapter<BillSplitModel> {
  @override
  final int typeId = 3;

  @override
  BillSplitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillSplitModel(
      fields[0] as double,
      fields[1] as PayeeModel,
    );
  }

  @override
  void write(BinaryWriter writer, BillSplitModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.payee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillSplitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PayeeModelAdapter extends TypeAdapter<PayeeModel> {
  @override
  final int typeId = 4;

  @override
  PayeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PayeeModel(
      fields[0] as String,
      (fields[1] as HiveList).castHiveList(),
      (fields[2] as HiveList).castHiveList(),
      (fields[3] as HiveList).castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, PayeeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.bills)
      ..writeByte(2)
      ..write(obj.billSplits)
      ..writeByte(3)
      ..write(obj.billItemSplits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

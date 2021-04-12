// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillModelAdapter extends TypeAdapter<BillModel> {
  @override
  final int typeId = 0;

  @override
  BillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    debugPrint(fields.toString());
    return BillModel(
      fields[0] as double,
      (fields[1] as SplitType),
      (fields[2] as HiveList).castHiveList(),
      (fields[3] as HiveList).castHiveList(),
      (fields[4] as HiveList).castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, BillModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.totalCost)
      ..writeByte(1)
      ..write(obj.splitType)
      ..writeByte(2)
      ..write(obj.billItems)
      ..writeByte(3)
      ..write(obj.billSplits)
      ..writeByte(4)
      ..write(obj.payees);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splitTypes_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SplitTypeAdapter extends TypeAdapter<SplitType> {
  @override
  final int typeId = 5;

  @override
  SplitType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SplitType.Value;
      case 1:
        return SplitType.Percentage;
      default:
        return SplitType.Value;
    }
  }

  @override
  void write(BinaryWriter writer, SplitType obj) {
    switch (obj) {
      case SplitType.Value:
        writer.writeByte(0);
        break;
      case SplitType.Percentage:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplitTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

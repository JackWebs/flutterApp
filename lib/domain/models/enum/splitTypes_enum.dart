import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:hive/hive.dart';

part 'splitTypes_enum.g.dart';

@HiveType(typeId: HiveBoxConstants.splitTypeTypeId)
enum SplitType {
@HiveField(0, defaultValue: true)
Value,
@HiveField(1)
Percentage,
}
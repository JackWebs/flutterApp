import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class PayeeModel extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList billSplits;

  @HiveField(2)
  HiveList billItemSplits;
}

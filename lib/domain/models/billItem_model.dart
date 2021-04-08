import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class BillItemModel extends HiveObject{
  @HiveField(0)
  double cost;

  @HiveField(1)
  int valueTypeId;

  @HiveField(2)
  HiveList billItemSplits;
  //int billId;
}
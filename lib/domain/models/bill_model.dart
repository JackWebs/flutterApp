import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BillModel extends HiveObject{
  @HiveField(0)
  double totalCost;

  @HiveField(1)
  HiveList billItems;

  @HiveField(2)
  HiveList billSplits;

  @HiveField(3)
  HiveList payees;
}
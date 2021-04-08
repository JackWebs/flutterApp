import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class BillSplitModel extends HiveObject {
  @HiveField(0)
  double value;
  /*int billId;
  int payeeId;*/
}
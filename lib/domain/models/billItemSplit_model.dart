import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class BillItemSplitModel extends HiveObject {
  @HiveField(0)
  double value;
  /*int billItemId;
  int payeeId;*/
}
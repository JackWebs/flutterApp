import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:hive/hive.dart';

part 'billItemSplit_model.g.dart';

@HiveType(typeId: HiveBoxConstants.billItemSplitTypeId)
class BillItemSplitModel extends HiveObject {
  @HiveField(0)
  double value;

  BillItemSplitModel(this.value);
}
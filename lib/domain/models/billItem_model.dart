
import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/billItemSplit_model.dart';
import 'package:bill_splitter/domain/models/enum/splitTypes_enum.dart';
import 'package:hive/hive.dart';

part 'billItem_model.g.dart';

@HiveType(typeId: HiveBoxConstants.billItemTypeId)
class BillItemModel extends HiveObject{
  @HiveField(0)
  double cost;

  @HiveField(1)
  SplitType splitType;

  @HiveField(2)
  HiveList<BillItemSplitModel> billItemSplits;

  BillItemModel(this.cost, this.splitType, this.billItemSplits);
}
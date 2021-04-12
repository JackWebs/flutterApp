
import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/billItemSplit_model.dart';
import 'package:bill_splitter/domain/models/billSplit_model.dart';
import 'package:bill_splitter/domain/models/bill_model.dart';
import 'package:hive/hive.dart';

part 'payee_model.g.dart';

@HiveType(typeId: HiveBoxConstants.payeeTypeId)
class PayeeModel extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<BillModel> bills;

  @HiveField(2)
  HiveList<BillSplitModel> billSplits;

  @HiveField(3)
  HiveList<BillItemSplitModel> billItemSplits;

  PayeeModel(this.name, this.bills, this.billSplits, this.billItemSplits);
}

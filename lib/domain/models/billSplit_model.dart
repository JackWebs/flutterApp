import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/payee_model.dart';
import 'package:hive/hive.dart';

part 'billSplit_model.g.dart';

@HiveType(typeId: HiveBoxConstants.billSplitTypeId)
class BillSplitModel extends HiveObject {
  @HiveField(0)
  double value;

  @HiveField(1)
  PayeeModel payee;

  BillSplitModel(this.value, this.payee);
}
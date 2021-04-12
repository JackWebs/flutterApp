
import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/billItem_model.dart';
import 'package:bill_splitter/domain/models/billSplit_model.dart';
import 'package:bill_splitter/domain/models/enum/splitTypes_enum.dart';
import 'package:bill_splitter/domain/models/payee_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'bill_model.g.dart';

@HiveType(typeId: HiveBoxConstants.billTypeId)
class BillModel extends HiveObject{
  @HiveField(0)
  double totalCost;

  @HiveField(1)
  SplitType splitType;

  @HiveField(2)
  HiveList<BillItemModel> billItems;

  @HiveField(3)
  HiveList<BillSplitModel> billSplits;

  @HiveField(4)
  HiveList<PayeeModel> payees;

  BillModel(this.totalCost, this.splitType, this.billItems, this.billSplits, this.payees);
}
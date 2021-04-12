import 'dart:io';

import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/billItemSplit_model.dart';
import 'package:bill_splitter/domain/models/billItem_model.dart';
import 'package:bill_splitter/domain/models/billSplit_model.dart';
import 'package:bill_splitter/domain/models/bill_model.dart';
import 'package:bill_splitter/domain/models/enum/splitTypes_enum.dart';
import 'package:bill_splitter/domain/models/payee_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  bool _mockData;

  HiveService(this._mockData);

  late Box<BillModel> _bills;
  late Box<PayeeModel> _payees;
  late Box<BillSplitModel> _billSplits;
  late Box<BillItemModel> _billItems;
  late Box<BillItemSplitModel> _billItemSplits;
  late Box<SplitType> _splitTypes;

  initialize() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    if (_mockData){
      appDirectory = Directory('${appDirectory.path}/mock/');
      if(await appDirectory.exists()){
        appDirectory.delete(recursive: true);
      }
    }

    if (!Hive.isAdapterRegistered(HiveBoxConstants.billTypeId)) Hive.registerAdapter<BillModel>(BillModelAdapter());
    if (!Hive.isAdapterRegistered(HiveBoxConstants.payeeTypeId)) Hive.registerAdapter<PayeeModel>(PayeeModelAdapter());
    if (!Hive.isAdapterRegistered(HiveBoxConstants.billSplitTypeId)) Hive.registerAdapter<BillSplitModel>(BillSplitModelAdapter());
    if (!Hive.isAdapterRegistered(HiveBoxConstants.billItemTypeId)) Hive.registerAdapter<BillItemModel>(BillItemModelAdapter());
    if (!Hive.isAdapterRegistered(HiveBoxConstants.billItemSplitTypeId)) Hive.registerAdapter<BillItemSplitModel>(BillItemSplitModelAdapter());
    if (!Hive.isAdapterRegistered(HiveBoxConstants.splitTypeTypeId)) Hive.registerAdapter<SplitType>(SplitTypeAdapter());

    Hive.init(appDirectory.path);

    _bills = await Hive.openBox<BillModel>(HiveBoxConstants.billBox);
    _payees = await Hive.openBox<PayeeModel>(HiveBoxConstants.payeeBox);
    _billSplits = await Hive.openBox<BillSplitModel>(HiveBoxConstants.billSplitBox);
    _billItems = await Hive.openBox<BillItemModel>(HiveBoxConstants.billItemBox);
    _billItemSplits = await Hive.openBox<BillItemSplitModel>(HiveBoxConstants.billItemSplitBox);
    _splitTypes = await Hive.openBox<SplitType>(HiveBoxConstants.splitTypeBox);

    if (_mockData){
      await _seedData();
    }
  }

  _seedData() async {
    PayeeModel payee1 = await addPayee("Rachel");
    PayeeModel payee2 = await addPayee("Jack");
    BillModel bill1 = await addBill(25, SplitType.Value);

    BillSplitModel bill1Split1 = new BillSplitModel(10, payee1);
    BillSplitModel bill1Split2 = new BillSplitModel(15, payee2);

    await addBillSplit(bill1, payee1, bill1Split1);
    await addBillSplit(bill1, payee2, bill1Split2);

    debugPrint("Seeded Data");

    debugPrint("bill 1 totalCost: " + bill1.totalCost.toString());

    for (var payee in bill1.payees.toList()){
      debugPrint("bill 1 payee: " + payee.name.toString());
    }

    for (var billSplit in bill1.billSplits.toList()){
      debugPrint("bill 1 split: " + billSplit.payee.name.toString() + " - " + billSplit.value.toString());
    }
  }

  Future<BillModel> addBill(double totalCost, SplitType splitType) async {
    BillModel bill = new BillModel(totalCost, splitType, HiveList<BillItemModel>(_billItems), HiveList<BillSplitModel>(_billSplits), HiveList<PayeeModel>(_payees));
    await _bills.add(bill);

    return bill;
  }

  Future<PayeeModel> addPayee(String name) async {
    PayeeModel payee = new PayeeModel(name, HiveList<BillModel>(_bills), HiveList<BillSplitModel>(_billSplits), HiveList<BillItemSplitModel>(_billItemSplits));
    await _payees.add(payee);

    return payee;
  }

  Future<int> addBillSplit(BillModel bill, PayeeModel payee, BillSplitModel billSplit) async {
    var key = await _billSplits.add(billSplit);

    bill.billSplits.add(billSplit);
    bill.payees.add(payee);
    bill.save();

    payee.billSplits.add(billSplit);
    payee.bills.add(bill);
    payee.save();

    return key;
  }

  Future<int> addBillItem(double totalCost, SplitType splitType, BillModel bill) async {
    BillItemModel billItem = new BillItemModel(totalCost, splitType, HiveList<BillItemSplitModel>(_billItemSplits));

    bill.billItems.add(billItem);
    bill.save();

    return await _billItems.add(billItem);
  }

  Future<int> addBillItemSplit(BillItemModel billItem, PayeeModel payee, BillItemSplitModel billItemSplit) async {
    var key = await _billItemSplits.add(billItemSplit);

    billItem.billItemSplits.add(billItemSplit);
    billItem.save();

    payee.billItemSplits.add(billItemSplit);
    payee.save();

    return key;
  }

  Future<List<BillModel>> getBillList() async {
    List<BillModel> billList = new List.empty();

    _bills.toMap().forEach((key, value) {billList.add(value);});

    return billList;
  }

  Future<BillModel?> getBill(int key) async {
    return _bills.get(key);
  }
}
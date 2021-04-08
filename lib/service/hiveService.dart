import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/domain/models/billItemSplit_model.dart';
import 'package:bill_splitter/domain/models/billItem_model.dart';
import 'package:bill_splitter/domain/models/billSplit_model.dart';
import 'package:bill_splitter/domain/models/bill_model.dart';
import 'package:bill_splitter/domain/models/payee_model.dart';
import 'package:hive/hive.dart';

class HiveService {

  Future<int> addBill(BillModel bill) async {
    var bills = await Hive.openBox<BillModel>(HiveBoxConstants.billBox);

    return await bills.add(bill);
  }

  Future<int> addPayee(PayeeModel payee) async {
    var payees = await Hive.openBox<PayeeModel>(HiveBoxConstants.payeeBox);
    return await payees.add(payee);
  }

  Future<int> addBillSplit(BillModel bill, PayeeModel payee, BillSplitModel billSplit) async {
    var billSplits = await Hive.openBox<BillSplitModel>(HiveBoxConstants.billSplitBox);
    var key = await billSplits.add(billSplit);

    bill.billSplits = HiveList(billSplits);
    bill.billSplits.add(billSplit);
    bill.save();

    payee.billSplits = HiveList(billSplits);
    payee.billSplits.add(billSplit);
    payee.save();

    return key;
  }

  Future<int> addBillItem(BillModel bill, BillItemModel billItem) async {
    var billItems = await Hive.openBox<BillItemModel>(HiveBoxConstants.billItemBox);
    var key = await billItems.add(billItem);

    bill.billItems = HiveList(billItems);
    bill.billItems.add(billItem);
    bill.save();

    return key;
  }

  Future<int> addBillItemSplit(BillItemModel billItem, PayeeModel payee, BillItemSplitModel billItemSplit) async {
    var billItemSplits = await Hive.openBox<BillItemSplitModel>(HiveBoxConstants.billItemSplitBox);
    var key = await billItemSplits.add(billItemSplit);

    billItem.billItemSplits = HiveList(billItemSplits);
    billItem.billItemSplits.add(billItemSplit);
    billItem.save();

    payee.billItemSplits = HiveList(billItemSplits);
    payee.billItemSplits.add(billItemSplit);
    payee.save();

    return key;
  }

 /* addToken(String token) {
    var box = Hive.box(HiveBoxConstants.userBox);
    box.put('userAuthTokenKey', token);
  }

  addLoginDetails(LoginDTO login) {
    var box = Hive.box(HiveBoxConstants.userBox);
    box.put('validUserLoginDetails', login.toJson());
  }

  String getToken() {
    var box = Hive.box(HiveBoxConstants.userBox);
    var token = box.get('userAuthTokenKey');
    return token;
  }

  String getLoginDetails() {
    var box = Hive.box(HiveBoxConstants.userBox);
    var loginJson = box.get('validUserLoginDetails');
    return loginJson;
  }

  clearToken() {
    var box = Hive.box(HiveBoxConstants.userBox);
    box.delete('userAuthTokenKey');
  }

  clearCredentials() {
    var box = Hive.box(HiveBoxConstants.userBox);
    box.delete('validUserLoginDetails');
  }

  storeCurrentAddress(int addressId) {
    var box = Hive.box(HiveBoxConstants.addressBox);
    box.put('selectedAddress', addressId);
  }

  int getCurrentAddress() {
    var box = Hive.box(HiveBoxConstants.addressBox);
    var selectedAddress = box.get('selectedAddress');
    return selectedAddress;
  }

  _clearCurrentAddress() {
    var box = Hive.box(HiveBoxConstants.addressBox);
    box.delete('selectedAddress');
  }

  storeCurrentCar(BookingCustomerCarPackageDTO customerCarPackageDTO) {
    var box = Hive.box(HiveBoxConstants.carsBox);
    box.add(customerCarPackageDTO.toJson());
  }

  List<BookingCustomerCarPackageDTO> getCurrentCars() {
    var box = Hive.box(HiveBoxConstants.carsBox);
    List<String> currentCars = [];
    for (int i = 0; i < box.length; i++) {
      currentCars.add(box.getAt(i));
    }

    List<BookingCustomerCarPackageDTO> cars =
    List<BookingCustomerCarPackageDTO>.from(currentCars
        .map((car) => BookingCustomerCarPackageDTO.fromJson(car)));

    return cars;
  }

  _clearCurrentCars() {
    var box = Hive.box(HiveBoxConstants.carsBox);
    box.clear();
  }

  clearCurrentBooking() {
    _clearCurrentAddress();
    _clearCurrentCars();
  }*/
}
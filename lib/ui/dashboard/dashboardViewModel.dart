import 'package:bill_splitter/domain/models/bill_model.dart';
import 'package:bill_splitter/helpers/viewModel.dart';
import 'package:bill_splitter/service/hiveService.dart';
import 'package:bill_splitter/ui/navigationManager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dashboardViewModel.g.dart';

class DashboardViewModel = _DashboardViewModel with _$DashboardViewModel;

abstract class _DashboardViewModel extends ViewModel with Store {
  final HiveService _hiveService;
  final NavigationManager _navigationManager;

  _DashboardViewModel(this._hiveService, this._navigationManager);

  @action
  Future<List<BillModel>> getBills() async{
    return await _hiveService.getBillList();
  }
}
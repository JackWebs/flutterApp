import 'package:bill_splitter/domain/models/bill_model.dart';
import 'package:bill_splitter/helpers/viewModel.dart';
import 'package:bill_splitter/service/hiveService.dart';
import 'package:bill_splitter/ui/navigationManager.dart';
import 'package:mobx/mobx.dart';

part 'dashboardViewModel.g.dart';

class DashboardViewModel = _DashboardViewModel with _$DashboardViewModel;

abstract class _DashboardViewModel extends ViewModel with Store {
  final HiveService _hiveService;
  final NavigationManager _navigationManager;

  _DashboardViewModel(this._hiveService, this._navigationManager);

  @computed
  Future<List<BillModel>> get bills async => await _hiveService.getBillList();
}
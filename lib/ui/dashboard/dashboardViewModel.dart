import 'package:bill_splitter/helpers/viewModel.dart';
import 'package:bill_splitter/service/hiveService.dart';
import 'package:bill_splitter/ui/navigationManager.dart';
import 'package:mobx/mobx.dart';

class DashboardViewModel extends ViewModel with Store {
  final HiveService _hiveService;
  final NavigationManager _navigationManager;

  DashboardViewModel(this._hiveService, this._navigationManager);
}
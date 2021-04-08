import 'package:bill_splitter/infra/serviceLocator.dart';
import 'package:bill_splitter/ui/dashboard/dashboardViewModel.dart';

class ViewModelFactory {
  final ServiceLocator _locator;

  ViewModelFactory(this._locator);

/*  LoginViewModel login() =>
      LoginViewModel(_locator.authManager, _locator.navigationManager);*/

  DashboardViewModel dashboard() => DashboardViewModel(_locator.hiveService, _locator.navigationManager);

  /*BookingsViewModel bookings() =>
      BookingsViewModel(_locator.hiveService, _locator.apiService);

  CarsViewModel cars() =>
      CarsViewModel(_locator.hiveService, _locator.apiService);

  DetailsViewModel details() =>
      DetailsViewModel(_locator.hiveService, _locator.apiService);

  BookingsStepperViewModel stepper() =>
      BookingsStepperViewModel(_locator.apiService, _locator.hiveService);*/
}
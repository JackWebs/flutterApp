import 'package:bill_splitter/helpers/startable.dart';
import 'package:bill_splitter/infra/viewModelFactory.dart';
import 'package:bill_splitter/service/hiveService.dart';
import 'package:bill_splitter/ui/navigationManager.dart';
import 'package:flutter/material.dart';

class ServiceLocator implements Startable {
  /// Services
  late HiveService hiveService;

  /// UI
  late NavigationManager navigationManager;

  /// Infra
  late ViewModelFactory viewModelFactory;

  /// Global State
  //DashboardViewModel dashboardViewModel;

  /// Creates a new container for our services and instantiates them
  ServiceLocator({bool mockData = false}) {
    viewModelFactory = ViewModelFactory(this);
    hiveService = HiveService(mockData);
    navigationManager = NavigationManager(viewModelFactory);
    /*dashboardViewModel = DashboardViewModel(
        apiService, hiveService, navigationManager, authManager);*/
  }

  @visibleForTesting
  ServiceLocator.empty();

  /// Runs any required startup code for all our services
  @override
  Future start() async {
    // Order can be important here if the services depend on each other
  }
}
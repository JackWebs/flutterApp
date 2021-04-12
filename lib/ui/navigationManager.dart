import 'package:bill_splitter/infra/viewModelFactory.dart';
import 'package:bill_splitter/ui/home/home.dart';
import 'package:flutter/material.dart';

class NavigationManager extends NavigatorObserver {
  late GlobalKey<NavigatorState> navigatorKey;
  final ViewModelFactory _viewModelFactory;

  NavigationManager(this._viewModelFactory) {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  /*Future progressToDashboard() {
    return _setRoot(DashboardPage(_viewModelFactory.dashboard()));
  }*/

  Future progressToHome() {
    return _setRoot(HomePage());
  }

  /*Future beginNewCustomerFlow() {
    return _push(NewCustomerBookingPage());
  }*/

  void pop<T>(T data) {
    navigatorKey.currentState!.pop<T>(data);
  }

  Future _setRoot(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => page,
            settings: RouteSettings(name: page.runtimeType.toString())),
            (Route<dynamic> route) => false);
  }

  Future<T> _push<T>(Widget page, {bool fullscreenDialog = false}) async {
    return await navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: page.runtimeType.toString())));
  }
}
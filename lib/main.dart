
import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/infra/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(ServiceLocator(mockData: true)));
}

class MyApp extends StatefulWidget {
  final ServiceLocator _serviceLocator;

  const MyApp(this._serviceLocator);

  @override
  _MyAppState createState() => _MyAppState(_serviceLocator);
}

class _MyAppState extends State<MyApp> {
  final ServiceLocator _serviceLocator;
  _MyAppState(this._serviceLocator);

  @override
  void initState() {
    super.initState();
    _serviceLocator.start().then((x) async {
      await _serviceLocator.navigationManager.progressToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bill Splitter',
        navigatorKey: _serviceLocator.navigationManager.navigatorKey,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            appBarTheme: AppBarTheme(backgroundColor: HexColor("#3c99a0"))),
        home: Container(color: HexColor("#3c99a0")));
  }

  @override
  void dispose() {
    Hive.box(HiveBoxConstants.billBox).close();
    Hive.box(HiveBoxConstants.payeeBox).close();
    Hive.box(HiveBoxConstants.billSplitBox).close();
    Hive.box(HiveBoxConstants.billItemBox).close();
    Hive.box(HiveBoxConstants.billItemSplitBox).close();
    super.dispose();
  }
}

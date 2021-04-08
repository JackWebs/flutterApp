import 'package:bill_splitter/domain/constants/hiveBoxConstants.dart';
import 'package:bill_splitter/infra/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  await Hive.openBox(HiveBoxConstants.billBox);
  await Hive.openBox(HiveBoxConstants.payeeBox);
  await Hive.openBox(HiveBoxConstants.billSplitBox);
  await Hive.openBox(HiveBoxConstants.billItemBox);
  await Hive.openBox(HiveBoxConstants.billItemSplitBox);
  runApp(MyApp(ServiceLocator()));
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
      await seedData();
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

  seedData() async {
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

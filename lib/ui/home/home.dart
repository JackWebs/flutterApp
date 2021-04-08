import 'package:bill_splitter/infra/serviceLocator.dart';
import 'package:bill_splitter/infra/viewModelFactory.dart';
import 'package:bill_splitter/ui/dashboard/dashboardView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(ServiceLocator());
}

class _HomePageState extends State<HomePage> {
  final ServiceLocator _serviceLocator;
  _HomePageState(this._serviceLocator);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }

  _buildHome() {
    var _viewModelFactory = ViewModelFactory(_serviceLocator);
    final List<Widget> _pages = [
      DashboardPage(_viewModelFactory.dashboard())
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              label: 'Dashboard',
              activeIcon: new Icon(
                Icons.dashboard,
                color: Colors.lightBlue,
              )),
          BottomNavigationBarItem(
              icon: new Icon(Icons.local_car_wash),
              label: 'Bookings',
              activeIcon: new Icon(
                Icons.local_car_wash,
                color: Colors.lightBlue,
              ))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

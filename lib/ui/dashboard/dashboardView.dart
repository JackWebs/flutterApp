import 'package:bill_splitter/helpers/viewModelRoot.dart';
import 'package:bill_splitter/ui/dashboard/dashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  final DashboardViewModel viewModel;

  const DashboardPage(
      this.viewModel, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelRoot(
      viewModel: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text('Dashboard',
                  style: GoogleFonts.raleway(color: Colors.white))),
        ),
      ),
    );
  }
}
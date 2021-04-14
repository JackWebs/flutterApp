import 'package:bill_splitter/helpers/viewModelRoot.dart';
import 'package:bill_splitter/ui/dashboard/dashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/models/bill_model.dart';

class DashboardView extends StatelessWidget {
  final DashboardViewModel viewModel;

  const DashboardView(
      this.viewModel, {
        Key? key,
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
        body: FutureBuilder<List<BillModel>>(
          future: viewModel.getBills(),
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.connectionState == ConnectionState.done){
              debugPrint(snapshot.data?.length.toString());
              children =  <Widget>[ ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data?[index];

                  return ListTile(
                    title: Text(item?.totalCost.toString() ?? "NOPE"),
                    //subtitle: item.buildSubtitle(context),
                  );
                },
              )];
            } else {
              children = const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        )
      ),
    );
  }
}
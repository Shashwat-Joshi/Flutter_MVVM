import 'package:city_care/pages/incidentListPage.dart';
import 'package:city_care/view_models/incidentListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => IncidentListViewModel(),
        child: IncidentListPage(),
      ),
      // home: IncidentListPage(),
    );
  }
}

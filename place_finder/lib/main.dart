import 'package:flutter/material.dart';
import 'package:place_finder/pages/homePage.dart';
import 'package:place_finder/viewModels/placeListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => PlaceListViewModel(),
        child: HomePage(),
      ),
    );
  }
}

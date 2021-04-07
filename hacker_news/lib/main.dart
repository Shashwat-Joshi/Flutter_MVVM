import 'package:flutter/material.dart';
import 'package:hacker_news/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hacker news",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

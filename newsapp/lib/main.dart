import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsListPage.dart';
import 'package:newsapp/viewModels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}

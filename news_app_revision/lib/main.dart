import 'package:flutter/material.dart';
import 'package:news_app_revision/pages/newsList.dart';
import 'package:news_app_revision/viewModels/newArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
        child: NewsList(),
      ),
      // home: NewsList(),
    );
  }
}

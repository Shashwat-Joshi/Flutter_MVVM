import 'package:flutter/material.dart';
import 'package:hacker_news/pages/home_page.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hacker news",
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => StoryListViewModel(),
          child: HomePage(),
        )
        // home: HomePage(),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryListViewModel>(context, listen: false).getTopStories();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoryListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: Text("Home Page"),
    );
  }
}

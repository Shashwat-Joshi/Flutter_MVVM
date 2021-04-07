import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/story_list.dart';
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

  void _navigateToCommentsPage(BuildContext context, StoryViewModel story) {
    // TODO: Navigate to comments page
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// We can either use the [Provider's vm] or the [consumer] depending
    /// upon the condition and requirement

    // final vm = Provider.of<StoryListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: Consumer<StoryListViewModel>(
        builder: (context, vm, child) {
          return StoryList(
            stories: vm.stories,
            onSelected: (StoryViewModel story) {
              _navigateToCommentsPage(context, story);
            },
          );
        },
      ),
    );
  }
}

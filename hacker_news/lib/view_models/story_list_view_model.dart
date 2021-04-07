import 'package:flutter/cupertino.dart';
import 'package:hacker_news/services/web_service.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class StoryListViewModel extends ChangeNotifier {
  List<StoryViewModel> stories = [];

  Future<void> getTopStories() async {
    final results = await WebService().getTopStories();
    this.stories =
        results.map((story) => StoryViewModel(story: story)).toList();
    notifyListeners();
  }
}

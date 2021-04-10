import 'package:flutter/foundation.dart';
import 'package:hacker_news/model/story.dart';
import 'package:hacker_news/services/web_service.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class CommentListViewModel extends ChangeNotifier {
  List<CommentViewModel> comments = [];

  void getCommentsByStoryId(StoryViewModel story) async {
    final comments = await WebService().getCommentsByStory(story.story);
    this.comments =
        comments.map((comment) => CommentViewModel(comment: comment)).toList();
    notifyListeners();
  }
}

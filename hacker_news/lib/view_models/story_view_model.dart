import 'package:hacker_news/model/story.dart';

class StoryViewModel {
  final Story _story;

  StoryViewModel({required Story story}) : this._story = story;

  String get title {
    return this._story.title ?? "";
  }

  String get url {
    return this._story.url ?? "";
  }

  int get commentNumbers {
    return this._story.commentIds == null ? 0 : this._story.commentIds!.length;
  }
}

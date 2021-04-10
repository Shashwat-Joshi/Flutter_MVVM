import 'package:hacker_news/model/story.dart';

class StoryViewModel {
  final Story story;

  StoryViewModel({required this.story});

  String get title {
    return this.story.title ?? "";
  }

  String get url {
    return this.story.url ?? "";
  }

  int get commentNumbers {
    return this.story.commentIds == null ? 0 : this.story.commentIds!.length;
  }
}

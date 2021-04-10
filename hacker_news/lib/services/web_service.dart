import 'dart:convert';
import 'package:hacker_news/model/comment.dart';
import 'package:hacker_news/model/story.dart';
import 'package:hacker_news/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Story>> getTopStories() async {
    final response = await http.get(Uri.parse(Constant.topStoriesUrl));

    if (response.statusCode == 200) {
      /// Successful [API] call
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(
          storyIds.take(10).map((storyId) => _getStory(storyId)));
    } else {
      /// [API] call failed
      throw Exception("Unable to fetch top stories");
    }
  }

  Future<Story> _getStory(int storyId) async {
    final response = await http.get(Uri.parse(Constant.getStoryUrl(storyId)));

    if (response.statusCode == 200) {
      /// Successful [API] call
      final result = jsonDecode(response.body);
      return Story.fromJSON(result);
    } else {
      /// [API] call failed
      throw Exception("Unable to fetch top story");
    }
  }

  Future<List<Comment>> getCommentsByStory(Story story) async {
    if (story.commentIds != null) {
      return Future.wait(story.commentIds!.map((commentId) async {
        final response =
            await http.get(Uri.parse(Constant.getCommentsUrl(commentId)));

        if (response.statusCode == 200) {
          /// Successful [API] call
          Map<String, dynamic> json = jsonDecode(response.body);
          return Comment.fromJSON(json);
        } else {
          /// [API] call failed
          throw Exception("Unable to get comments");
        }
      }));
    } else {
      throw Exception("No comments found");
    }
  }
}

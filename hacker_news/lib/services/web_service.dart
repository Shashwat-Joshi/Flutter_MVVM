import 'dart:convert';

import 'package:hacker_news/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebService {
  void getTopStories() async {
    final response = await http.get(Uri.parse(Constant.topStoriesUrl));

    if (response.statusCode == 200) {
      /// Successful [API] call
      Iterable storyIds = jsonDecode(response.body);
    } else {
      /// [API] call failed
      throw Exception("Unable to fetch top stories");
    }
  }
}

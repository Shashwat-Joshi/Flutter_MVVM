import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/utils/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(Constants.TOP_HEADLINES_URL));

    if (response.statusCode == 200) {
      // Successful API call
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      print(list.length);
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      // API call failed
      throw Exception("Failed to get top news");
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(
      {required String keyword}) async {
    final response =
        await http.get(Uri.parse(Constants.headlinesByKeywordURL(keyword)));

    if (response.statusCode == 200) {
      // Successful API call
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      print(list.length);
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      // API call failed
      throw Exception("Failed to get top news");
    }
  }
}

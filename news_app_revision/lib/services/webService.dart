import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_revision/model/newsArticle.dart';
import 'package:news_app_revision/utils/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(Constants.topHeadlinesUrl));

    if (response.statusCode == 200) {
      // API call was successful
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      // API call failed
      throw Exception("Failed to load data");
    }
  }

  Future<List<NewsArticle>> fetchNewsByKeyword(String keyword) async {
    final response =
        await http.get(Uri.parse(Constants.searchByKeywordUrl(keyword)));

    if (response.statusCode == 200) {
      // API call was successful
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      // API call failed
      throw Exception("Failed to load data");
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:news_app_revision/model/newsArticle.dart';
import 'package:news_app_revision/services/webService.dart';
import 'package:news_app_revision/viewModels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = [];

  void populateTopNews() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    print("Loading successful ${articles.length}");

    notifyListeners();
  }
}

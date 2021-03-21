import 'package:flutter/foundation.dart';
import 'package:news_app_revision/model/newsArticle.dart';
import 'package:news_app_revision/services/webService.dart';
import 'package:news_app_revision/viewModels/newsArticleViewModel.dart';

enum LoadingState {
  SEARCHING,
  COMPLETE,
  EMPTY,
}

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingState.SEARCHING;
  List<NewsArticleViewModel> articles = [];
  static bool loadedOnce = false;

  /// [populateTopNews()] is to fetch the top news for the very first time when the app is started
  /// When loaded once we will use the static bool loadedOnce to use notifyListeners() again.
  void populateTopNews() async {
    this.loadingStatus = LoadingState.SEARCHING;

    if (loadedOnce) {
      notifyListeners();
    } else {
      loadedOnce = true;
    }
    try {
      List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      print("Loading successful ${articles.length}");
      this.loadingStatus =
          articles.length != 0 ? LoadingState.COMPLETE : LoadingState.EMPTY;
    } catch (e) {
      // Failed to fetch News
      this.loadingStatus = LoadingState.EMPTY;
    }

    notifyListeners();
  }

  void populateSearchByKeyword(String keyword) async {
    this.loadingStatus = LoadingState.SEARCHING;
    notifyListeners();

    try {
      List<NewsArticle> newsArticles =
          await WebService().fetchNewsByKeyword(keyword);

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      print("Loading successful ${articles.length}");
      this.loadingStatus =
          articles.length != 0 ? LoadingState.COMPLETE : LoadingState.EMPTY;
    } catch (e) {
      // Failed to fetch News
      this.loadingStatus = LoadingState.EMPTY;
    }

    notifyListeners();
  }
}

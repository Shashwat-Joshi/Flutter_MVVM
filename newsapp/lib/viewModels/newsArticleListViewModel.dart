import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webService.dart';
import 'package:newsapp/viewModels/newArticleViewModel.dart';

enum LoadingStatus {
  COMPLETED,
  SEARCHING,
  EMPTY,
}

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.SEARCHING;

  List<NewsArticleViewModel> articles = [];

  void populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.SEARCHING;

    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.EMPTY : LoadingStatus.COMPLETED;
    notifyListeners();
  }

  void populateSearchedHeadlines({required String keyword}) async {
    this.loadingStatus = LoadingStatus.SEARCHING;
    notifyListeners();

    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword(keyword: keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(newsArticle: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.EMPTY : LoadingStatus.COMPLETED;
    notifyListeners();
  }
}

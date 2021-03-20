import 'package:newsapp/models/newsArticle.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({
    required NewsArticle newsArticle,
  }) : _newsArticle = newsArticle;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}

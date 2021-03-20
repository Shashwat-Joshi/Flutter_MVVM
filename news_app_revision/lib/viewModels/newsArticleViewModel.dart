import 'package:news_app_revision/model/newsArticle.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({
    required NewsArticle article,
  }) : this._newsArticle = article;

  String? get title {
    return this._newsArticle.title;
  }

  String? get description {
    return this._newsArticle.description;
  }

  String? get urlToImage {
    return this._newsArticle.urlToImage;
  }

  String? get url {
    return this._newsArticle.url;
  }
}

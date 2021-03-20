class NewsArticle {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsArticle.fromJSON(Map news) {
    return NewsArticle(
      title: news["title"],
      description: news["description"],
      urlToImage: news["urlToImage"],
      url: news["url"],
    );
  }
}

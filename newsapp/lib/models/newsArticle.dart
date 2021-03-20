class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsArticle.fromJson(Map news) {
    return NewsArticle(
      title: news['title'].toString(),
      description: news['description'].toString(),
      urlToImage: news['urlToImage'].toString(),
      url: news['url'].toString(),
    );
  }
}

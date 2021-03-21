import 'package:flutter/material.dart';
import 'package:news_app_revision/viewModels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsDetails({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.article.title!),
      ),
      body: WebView(
        initialUrl: this.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

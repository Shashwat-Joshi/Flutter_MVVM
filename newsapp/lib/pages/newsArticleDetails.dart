import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/newArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    print(this.article.url);
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
      body: WebView(
        initialUrl: this.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

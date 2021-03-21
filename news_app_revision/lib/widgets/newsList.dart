import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_revision/viewModels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function onTapNews;

  NewsList({
    required this.articles,
    required this.onTapNews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        NewsArticleViewModel article = articles[index];
        return Column(
          children: [
            Divider(),
            ListTile(
              onTap: () {
                /// Go to [NewsDetails] screen using the URL from ArticleModel
                this.onTapNews(article);
              },
              title: Text(article.title ?? "Unknown"),
              leading: Container(
                width: 100.0,
                child: Center(
                  child: article.urlToImage == null
                      ? Image.asset("images/news.jpg")
                      : Image.network(
                          article.urlToImage ?? "",
                          errorBuilder: (context, Object object,
                                  StackTrace? stackTrace) =>
                              Image.asset("images/news.jpg"),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

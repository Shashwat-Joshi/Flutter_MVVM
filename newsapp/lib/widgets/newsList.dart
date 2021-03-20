import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/newArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function? onTap;

  NewsList({required this.articles, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, i) {
        final article = articles[i];
        return Column(
          children: [
            Divider(),
            ListTile(
              onTap: () {
                this.onTap!(article);
              },
              title: Text(article.title),
              leading: Container(
                width: 100,
                height: 100,
                child: Center(
                  child: article.urlToImage == "null"
                      ? Image.asset("images/news.jpg")
                      : Image.network(
                          article.urlToImage,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset("images/news.jpg");
                          },
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

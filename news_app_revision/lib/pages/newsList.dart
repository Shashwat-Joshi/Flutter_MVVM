import 'package:flutter/material.dart';
import 'package:news_app_revision/viewModels/newArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
    );
  }
}

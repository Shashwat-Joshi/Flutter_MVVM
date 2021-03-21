import 'package:flutter/material.dart';
import 'package:news_app_revision/viewModels/newArticleListViewModel.dart';
import 'package:news_app_revision/widgets/newsList.dart';
import 'package:provider/provider.dart';

import 'newsDetails.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopNews();
  }

  Widget _buildWidget(NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingState.SEARCHING:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingState.EMPTY:
        return Center(
          child: Text("No results found"),
        );
      case LoadingState.COMPLETE:
        return Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              viewModel.populateTopNews();
              return Future.value();
            },
            child: NewsList(
              articles: viewModel.articles,
              onTapNews: (article) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetails(article: article),
                  ),
                );
              },
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        title: Text("Top News"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            child: TextField(
              onSubmitted: (val) {
                if (val.isNotEmpty) {
                  viewModel.populateSearchByKeyword(val);
                }
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
              ),
            ),
          ),
          _buildWidget(viewModel),
        ],
      ),
    );
  }
}

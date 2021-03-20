import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/newArticleViewModel.dart';
import 'package:newsapp/viewModels/newsArticleListViewModel.dart';
import 'package:newsapp/widgets/newsList.dart';
import 'package:provider/provider.dart';
import 'newsArticleDetails.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailsPage(
          article: article,
        ),
      ),
    );
  }

  Widget _buildList(NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.SEARCHING:
        return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.EMPTY:
        return Align(
          alignment: Alignment.center,
          child: Text("No results found"),
        );
      case LoadingStatus.COMPLETED:
        return Expanded(
          child: NewsList(
            articles: vm.articles,
            onTap: (article) {
              _showNewsArticleDetails(context, article);
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 15.0,
              right: 15.0,
              bottom: 20.0,
            ),
            child: TextField(
              onSubmitted: (val) {
                // Fetch all the news related to the keyword

                if (val.isNotEmpty) {
                  viewModel.populateSearchedHeadlines(keyword: val);
                }
              },
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
          _buildList(viewModel),
        ],
      ),
    );
  }
}

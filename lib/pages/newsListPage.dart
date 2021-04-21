import 'package:flutter/material.dart';
import 'package:fresh_news_2/viewmodels/newsArticleListViewModel.dart';
import 'package:fresh_news_2/viewmodels/newsArticleViewModel.dart';
import 'package:fresh_news_2/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>  Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines());
   
  }
  
  Widget _buildList(NewsArticleListViewModel vm) {
    switch(vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator(),);
      case LoadingStatus.empty:
        return Align(child: Text("Search returned no results"));
      case LoadingStatus.completed:
        return Expanded(child: NewsList(articles: vm.articles));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Search Term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
          _buildList(vm)
          ],
        ));
  }
}

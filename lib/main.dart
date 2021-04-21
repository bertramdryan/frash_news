import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'pages/newsListPage.dart';
import 'viewmodels/newsArticleListViewModel.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Fresh News", 
      home: 
      ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(), 
        child: NewsListPage()
      )
    );
    
  }

}


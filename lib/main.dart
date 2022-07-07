import 'package:flutter/material.dart';
import 'package:newapp/allScreen.dart';
import 'package:newapp/data/data.dart';
import 'package:newapp/dataModels/dataModels.dart';
import 'package:newapp/favoriteScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  likedNews(NewsArticle newsArticle) {
    int index = news.indexOf(newsArticle);
    news[index].isliked = !news[index].isliked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          bottom: const TabBar(tabs: [Text('ALL'), Text('FAVORITE')]),
        ),
        body: TabBarView(
            children: [AllNewsScreen(likedNews), FavoriteScreen(likedNews)]),
      ),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/data/data.dart';
import 'package:newapp/dataModels/dataModels.dart';
import 'package:newapp/news_widget.dart';

class AllNewsScreen extends StatelessWidget {
  Function fun;
  AllNewsScreen(this.fun);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: news.length,
            itemBuilder: ((context, index) {
              return NewsWidget(news[index], fun);
            })));
  }
}

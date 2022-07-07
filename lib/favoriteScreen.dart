import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/data/data.dart';
import 'package:newapp/dataModels/dataModels.dart';

import 'news_widget.dart';

class FavoriteScreen extends StatelessWidget {
  Function fun;
  FavoriteScreen(this.fun);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: news.where((element) => element.isliked).toList().length,
            itemBuilder: ((context, index) {
              return NewsWidget(
                  news.where((element) => element.isliked).toList()[index],
                  fun);
            })));
  }
}

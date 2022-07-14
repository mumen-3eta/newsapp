import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/data/data.dart';
import 'news_widget.dart';

class FavoriteScreen extends StatelessWidget {
  Function fun;
  FavoriteScreen(this.fun);

  @override
  Widget build(BuildContext context) {
    if (news.where((element) => element.isliked).toList().isEmpty) {
      return LottieBuilder.asset('assets/animation/notFound.json');
    } else {
      return Center(
          child: ListView.builder(
              itemCount:
                  news.where((element) => element.isliked).toList().length,
              itemBuilder: ((context, index) {
                return NewsWidget(
                    news.where((element) => element.isliked).toList()[index],
                    fun);
              })));
    }
  }
}

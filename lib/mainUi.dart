import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'allScreen.dart';
import 'contactusUi.dart';
import 'data/data.dart';
import 'dataModels/dataModels.dart';
import 'favoriteScreen.dart';

class MainUi extends StatefulWidget {
  @override
  State<MainUi> createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  likedNews(NewsArticle newsArticle) {
    int index = news.indexOf(newsArticle);
    news[index].isliked = !news[index].isliked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                if (context.locale.toString() == 'en') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              child: const Icon(Icons.language_rounded),
            )
          ],
          title: Text('News'.tr()),
          bottom: TabBar(tabs: [
            Text('ALL'.tr()),
            Text('FAVORITE'.tr()),
            Text('CONTACTUS'.tr())
          ]),
        ),
        body: TabBarView(children: [
          AllNewsScreen(likedNews),
          FavoriteScreen(likedNews),
          ContactusUi()
        ]),
      ),
    );
  }
}

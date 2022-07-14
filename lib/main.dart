import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newapp/allScreen.dart';
import 'package:newapp/contactusUi.dart';
import 'package:newapp/data/data.dart';
import 'package:newapp/dataModels/dataModels.dart';
import 'package:newapp/favoriteScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: MyApp()),
  );
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: DefaultTabController(
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
        ));
  }
}

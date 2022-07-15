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

class _MainUiState extends State<MainUi> with SingleTickerProviderStateMixin {
  likedNews(NewsArticle newsArticle) {
    int index = news.indexOf(newsArticle);
    news[index].isliked = !news[index].isliked;
    setState(() {});
  }

  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initTabBar();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    child: Text('O'),
                  ),
                  accountName: Text('Omar'.tr()),
                  accountEmail: const Text('omar@gmail.com')),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: Text('Go to home'.tr()),
                title: Text('Home'.tr()),
                onTap: () {
                  tabController!.animateTo(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: Text('Go to Favourite news'.tr()),
                title: Text('Favourite'.tr()),
                onTap: () {
                  tabController!.animateTo(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts_outlined),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: Text('Go to Contact Info'.tr()),
                title: Text('Contact Us'.tr()),
                onTap: () {
                  tabController!.animateTo(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    if (context.locale.toString() == 'en') {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  child: const Icon(Icons.language_rounded)),
            )
          ],
          title: Text('News'.tr()),
          bottom: TabBar(controller: tabController!, tabs: [
            Text('ALL'.tr()),
            Text('FAVORITE'.tr()),
            Text('CONTACTUS'.tr())
          ]),
        ),
        body: TabBarView(controller: tabController!, children: [
          AllNewsScreen(likedNews),
          FavoriteScreen(likedNews),
          ContactusUi()
        ]),
      ),
    );
  }
}

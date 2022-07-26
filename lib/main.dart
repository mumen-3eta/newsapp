import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newapp/mainUi.dart';
import 'package:newapp/navigationExe/navigationConstats.dart';
import 'package:newapp/navigationExe/screen2.dart';

import 'navigationExe/screen1.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationConstants.navkey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Screen1(),
      // routes: {
      //   NavigationConstants.screen1: (context) => Screen1(),
      //   NavigationConstants.screen2: (context) => Screen2()
      // },
      // onGenerateRoute: (RouteSettings settings) {
      //   String? name = settings.name;
      //   dynamic arguments = settings.arguments;
      //   if (name == NavigationConstants.screen2) {
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return Screen2(arguments[0].toString(), arguments[1]);
      //       },
      //     );
      //   }
      // },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newapp/navigationExe/screen2.dart';

import 'navigationConstats.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context, "hello");
            return Future.value(true);
          } else {
            return Future.value(false);
          }
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              NavigationConstants.navigateToWidget(Screen2());
            },
          ),
          appBar: AppBar(
            title: const Text('screen1'),
          ),
          body: const Center(

              //     child: ElevatedButton(
              //   onPressed: () async {
              //     dynamic x = await NavigationConstants.navigateToWidgetAsync(
              //         Screen2("screen2", 12));
              //     // dynamic x = await Navigator.push(context,
              //     //     MaterialPageRoute(builder: ((context) {
              //     //   return Screen2();
              //     // })));
              //     print(x.toString());
              //   },
              //   child: const Text("go to screen2"),
              // )),
              ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_challenge/modules/bindings/data_bindings.dart';
import 'package:get/get.dart';

import 'screens/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: DataBindings(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

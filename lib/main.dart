
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/splash/splash_screen.dart';


void main() {
  runApp(const MyTinderApp());
}

class MyTinderApp extends StatelessWidget {
  const MyTinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: ThemeMode.light,
      theme: ThemeData(),
    );
  }
}


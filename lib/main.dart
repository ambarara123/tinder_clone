
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tinder_clone/app/pages/main/main_app.dart';
import 'package:tinder_clone/app/pages/splash/splash_screen.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            primary: Colors.white,
            shape: CircleBorder(),
            minimumSize: Size.square(50)
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/app/pages/main/main_app.dart';
import 'package:tinder_clone/app/utils/CardProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CardProvider(),
    child: GetMaterialApp(
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
      home: MainApp(),
    ),
  ));
}

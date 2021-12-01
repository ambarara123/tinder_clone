
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/app/pages/main/main_app.dart';
import 'package:tinder_clone/app/utils/CardProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CardProvider(),
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    ),
  ));
}

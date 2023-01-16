import 'package:flutter/material.dart';
import 'package:tinder_clone/app/data/model/BottomNavigationItemModel.dart';

class TinderData {
  static List<BottomNavigationItemModel> bottomNavigationItems = [
    BottomNavigationItemModel(const Icon(Icons.home), 'Explore'),
    BottomNavigationItemModel(const Icon(Icons.add_shopping_cart_rounded), 'Top Picks'),
    BottomNavigationItemModel(const Icon(Icons.bookmark), 'Chat'),
    BottomNavigationItemModel(const Icon(Icons.person), 'Profile')
  ];
}

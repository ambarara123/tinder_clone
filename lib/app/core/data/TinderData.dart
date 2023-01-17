import 'package:flutter/material.dart';
import 'package:tinder_clone/app/data/model/BottomNavigationItemModel.dart';

class TinderData {
  static List<BottomNavigationItemModel> bottomNavigationItems = [
    BottomNavigationItemModel(const Icon(Icons.fire_extinguisher), 'Home'),
    BottomNavigationItemModel(const Icon(Icons.explore), 'Explore'),
    BottomNavigationItemModel(const Icon(Icons.thumbs_up_down), 'Top Picks'),
    BottomNavigationItemModel(const Icon(Icons.message), 'Chat'),
    BottomNavigationItemModel(const Icon(Icons.person), 'Profile')
  ];
}

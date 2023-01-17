import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/app/TopDestinationNavController.dart';
import 'package:tinder_clone/app/core/data/TinderData.dart';
import 'package:tinder_clone/feature/chat/ChatScreen.dart';
import 'package:tinder_clone/feature/explore/ExploreScreen.dart';
import 'package:tinder_clone/feature/home/home_screen.dart';
import 'package:tinder_clone/feature/profile/ProfileScreen.dart';
import 'package:tinder_clone/feature/top_likes/TopLikesScreen.dart';


final TopDestinationNavController controller = Get.put(TopDestinationNavController());

class TinderTopDestinationFile extends StatelessWidget {
  TinderTopDestinationFile({Key? key}) : super(key: key);

  final List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    TopLikesScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentBottomNavItemIndex.value,
          showUnselectedLabels: true,
          onTap: controller.switchBetweenBottomNavigationItems,
          fixedColor: Colors.black,
          items: TinderData.bottomNavigationItems
              .map(
                (element) => BottomNavigationBarItem(
                    icon: element.icon, label: element.title),
              ).toList(),
        );
      }),
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}

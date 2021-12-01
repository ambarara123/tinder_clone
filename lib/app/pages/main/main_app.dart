
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/app/pages/explore/tindercard.dart';
import 'package:tinder_clone/app/pages/main/main_app_controller.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    final MainAppController controller = Get.put(MainAppController());

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: getBottomBar(controller),
      body: getBody(controller),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("Tinder",style: TextStyle(color: Colors.red),),
    );
  }

  Widget getBottomBar(MainAppController controller) {
    return BottomNavigationBar(
      items: getBottomBarItems(),
      onTap: (index){
        setState(() {
          controller.setPageIndex(index);
          //printInfo(index.toString(),this)
        });
      },
      type: BottomNavigationBarType.fixed,
    );

  }

  List<BottomNavigationBarItem> getBottomBarItems() {
    var icons = [
      Icon(Icons.circle),Icon(Icons.circle),Icon(Icons.circle),Icon(Icons.circle)
    ];
    var activeIcons = [
      Icon(Icons.play_circle_filled, color: Colors.red,),Icon(Icons.play_circle_filled, color: Colors.red),Icon(Icons.play_circle_filled, color: Colors.red),Icon(Icons.play_circle_filled, color: Colors.red)
    ];
    return List.generate(icons.length, (index)  {
      return BottomNavigationBarItem(icon: icons[index],activeIcon: activeIcons[index], label: "");
    });
  }

  Widget getBody(MainAppController controller) {
    return Obx(()=> getScreen(controller.pageIndex.value));
  }

  Widget getScreen(index){
    Widget page;
    switch(index) {
      case 0: {
        return getHomePage(index);
        // statements;
      }

      case 1: {
        return getHomePage(index);
        //statements;
      }

      case 2: {
        return getHomePage(index);
        //statements;
      }

      case 3: {
        return getHomePage(index);
        //statements;
      }

      default: {
        return getHomePage(index);
        //statements;
      }
    }
  }

  Widget getHomePage(index){
    return IndexedStack(
      index: index,
      children: [
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
        TinderCard(imageUrl: "https://image.shutterstock.com/image-photo/autumn-park-yellow-trees-road-260nw-1527128807.jpg",),
      ],
    );
  }

  Widget getProfilePage(){
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/app/pages/main/card/tindercard.dart';

import 'package:tinder_clone/app/pages/main/main_app_controller.dart';
import 'package:tinder_clone/app/pages/main/card/CardController.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //Icons.local_fire_department_rounded

  @override
  Widget build(BuildContext context) {
    final MainAppController controller = Get.find();
    Get.put(CardController());

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white70
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        bottomNavigationBar: getBottomBar(controller),
        body: getBody(controller),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Tinder",
        style: TextStyle(color: Colors.red),
      ),
      leading:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          Icons.local_fire_department,
          color: Colors.red,
        ),
      ),
      leadingWidth: 20,
    );
  }

  Widget getBottomBar(MainAppController controller) {
    return BottomNavigationBar(
      items: getBottomBarItems(),
      onTap: (index) {
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
      Icon(Icons.local_fire_department),
      Icon(Icons.explore_outlined),
      Icon(Icons.star_outline_sharp),
      Icon(Icons.messenger_outline),
    ];
    var activeIcons = [
      Icon(
        Icons.local_fire_department,
        color: Colors.red,
      ),
      Icon(Icons.play_circle_filled, color: Colors.red),
      Icon(Icons.star_outline_sharp, color: Colors.red),
      Icon(Icons.messenger)
    ];
    return List.generate(icons.length, (index) {
      return BottomNavigationBarItem(
          icon: icons[index], activeIcon: activeIcons[index], label: "");
    });
  }

  Widget getBody(MainAppController controller) {
    return Stack(children: [
      getHomePage(),
      Positioned(
        child: getBottomButtons(),
        bottom: 30,
        left: 10,
        right: 10,
      )
    ]);
  }

  Widget getScreen(index) {
    Widget page;
    switch (index) {
      case 0:
        {
          return getHomePage();
          // statements;
        }

      case 1:
        {
          return getHomePage();
          //statements;
        }

      case 2:
        {
          return getHomePage();
          //statements;
        }

      case 3:
        {
          return getHomePage();
          //statements;
        }

      default:
        {
          return getHomePage();
          //statements;
        }
    }
  }

  Widget getHomePage() {


    return GetBuilder<CardController>(
      builder: (controller) => Stack(
        children: controller.imageUrls
            .map((url) => TinderCard(
                  imageUrl: url,
                  isFront: controller.imageUrls.last == url,
                ))
            .toList(),
      ),
    );
  }

  Widget getProfilePage() {
    return Container();
  }
  bool isLike(swipeType)=> swipeType == SwipeType.LIKE;
  bool isSuperLike(swipeType)=> swipeType == SwipeType.SUPER_LIKE;
  bool isDislike(swipeType)=> swipeType == SwipeType.DISLIKE;

  Widget getBottomButtons() {
    return GetBuilder<CardController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: getButtonBackgroundColor(Colors.transparent,Colors.yellowAccent,false),
                foregroundColor: getButtonBackgroundColor(Colors.yellow.shade100, Colors.white,false),
                side: getButtonBorder(Colors.yellowAccent, Colors.black12,false)
            ),
            onPressed: () {},
            child: RotatedBox(
              quarterTurns: -1,
              child: Icon(
                Icons.refresh,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: getButtonBackgroundColor(Colors.transparent,Colors.red,isDislike(controller.getType())),
                foregroundColor: getButtonBackgroundColor(Colors.red, Colors.white,isDislike(controller.getType())),
              side: getButtonBorder(Colors.red, Colors.black12,isDislike(controller.getType()))
            ),
              onPressed: () {
                controller.disLike();
              },
              child: Icon(
                Icons.clear,
              )),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: getButtonBackgroundColor(Colors.transparent,Colors.blue,isSuperLike(controller.getType())),
                  foregroundColor: getButtonBackgroundColor(Colors.blue, Colors.white,isSuperLike(controller.getType())),
                  side: getButtonBorder(Colors.blue, Colors.black12,isSuperLike(controller.getType()))
              ),
              onPressed: () {
                controller.superLike();
              },
              child: Icon(
                Icons.star,
              )),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: getButtonBackgroundColor(Colors.transparent,Colors.greenAccent,isLike(controller.getType())),
                  foregroundColor: getButtonBackgroundColor(Colors.greenAccent, Colors.white,isLike(controller.getType())),
                  side: getButtonBorder(Colors.greenAccent, Colors.black12,isLike(controller.getType()))
              ),
              onPressed: () {
                controller.like();
              },
              child: Icon(
                Icons.favorite,
              )),
          RotatedBox(
            quarterTurns: 3,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: getButtonBackgroundColor(Colors.transparent,Colors.purpleAccent,false),
                    foregroundColor: getButtonBackgroundColor(Colors.purpleAccent, Colors.white,false),
                    side: getButtonBorder(Colors.purpleAccent, Colors.black12,false)
                ),
                onPressed: () {},
                child: Icon(
                  Icons.timeline,
                )),
          ),
        ],
      ),
    );
  }

  MaterialStateProperty<Color> getButtonBackgroundColor(Color color, Color colorPressed, bool isForced) {
    final colors = (Set<MaterialState> states){
      if(isForced || states.contains(MaterialState.pressed)){
        return colorPressed;
      }
      return color;
    };
    return MaterialStateProperty.resolveWith(colors);
  }

  MaterialStateProperty<BorderSide> getButtonBorder(Color color, Color colorPressed, bool isForced) {
    final borderColor = (Set<MaterialState> states){
      if(isForced || states.contains(MaterialState.pressed)){
        return BorderSide(color: colorPressed, width: 2);
      }
      return  BorderSide(color: color, width: 2);
    };
    return MaterialStateProperty.resolveWith(borderColor);
  }
}

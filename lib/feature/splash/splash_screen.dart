import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_clone/app/TinderTopDestinationFile.dart';
import 'package:tinder_clone/feature/home/home_screen.dart';
import 'package:tinder_clone/feature/home/home_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var appController = Get.put(HomeScreenController());

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    Timer(Duration(milliseconds: 700), () => _controller.forward());
    Timer(Duration(milliseconds: 1200), () {
      appController.setSecondWidget();
    });

    _animation = Tween<Offset>(
      begin: const Offset(-0.0, 0.0),
      end: const Offset(0.99999999999999, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    ));
    Timer(Duration(milliseconds: 2800), () => Get.off(() => TinderTopDestinationFile()));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Center(
                  child: SlideTransition(
                    position: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.red.shade100,
                            Colors.red.shade700
                          ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedCrossFade(
                    crossFadeState: controller.first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 500),
                    firstChild: Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "tinder",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    secondChild: Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                      size: 60,
                    ),
                    firstCurve: Curves.easeOutBack,
                    secondCurve: Curves.easeInBack,
                  ),
                )
              ],
            ));
  }
}

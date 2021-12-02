import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  List<String> _imageUrls = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  Offset get position => _position;

  bool get isDragging => _isDragging;

  double get angle => _angle;

  List<String> get imageUrls => _imageUrls;

  // Size get screenSize => _screenSize;

  void start(DragStartDetails details) {
    _isDragging = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    resetUsers();
  }

  void updateDragDetails(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    //Notify listeners to render UI
    update();
  }

  void end() {
    _isDragging = false;
    update();

    final swipeType = getType(force: true);

    switch (swipeType) {
      case SwipeType.LIKE:
        like();
        break;
      case SwipeType.DISLIKE:
        disLike();
        break;
      case SwipeType.SUPER_LIKE:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    update();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
    update();
  }

  void resetUsers() {
    List<int>.generate(20, (i) {
    _imageUrls.add("https://picsum.photos/200/300?random=$i");
     return i + 1;
    });
    update();
  }

  SwipeType? getType({bool force = false}) {
    if(force) {
      if (_position.dx > 100) {
        return SwipeType.LIKE;
      } else if (position.dx < -100) {
        return SwipeType.DISLIKE;
      } else if (position.dy < -75 && position.dx.abs() < 20) {
        return SwipeType.SUPER_LIKE;
      }
    }else{
      if (_position.dx > 20) {
        return SwipeType.LIKE;
      } else if (position.dx < -20) {
        return SwipeType.DISLIKE;
      } else if (position.dy < -40 && position.dx.abs() < 20) {
        return SwipeType.SUPER_LIKE;
      }
    }
  }

  double getCardOpacity() {
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    return min(pos/delta, 1);
  }

  void like() {
    _angle = 20;
    _position += Offset(_screenSize.width, 0);
    _showNextCard();
    update();
  }

  void disLike() {
    _angle = -20;
    _position -= Offset(_screenSize.width, 0);
    _showNextCard();
    update();
  }

  void superLike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _showNextCard();
    update();
  }

  Future _showNextCard() async {
    if (_imageUrls.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 300));
    _imageUrls.removeLast();
    resetPosition();
  }
}

enum SwipeType { LIKE, DISLIKE, SUPER_LIKE }

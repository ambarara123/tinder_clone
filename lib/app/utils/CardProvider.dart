import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
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

    notifyListeners();
  }

  CardProvider() {
    resetUsers();
  }

  void update(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    //Notify listeners to render UI
    notifyListeners();
  }

  void end() {
    _isDragging = false;
    notifyListeners();

    final swipeType = getType();

    switch (swipeType) {
      case SwipeType.like:
        like();
        break;
      case SwipeType.dislike:
        disLike();
        break;
      case SwipeType.superLike:
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
    notifyListeners();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
    notifyListeners();
  }

  void resetUsers() {
    List<int>.generate(20, (i) {
    _imageUrls.add("https://picsum.photos/200/300?random=$i");
     return i + 1;
    });
    notifyListeners();
  }

  SwipeType getType() {
    if (_position.dx > 100) {
      return SwipeType.like;
    } else if (position.dx < -100) {
      return SwipeType.dislike;
    } else if (position.dy < -75 && position.dx.abs() < 20) {
      return SwipeType.superLike;
    }
    return SwipeType.nothing;
  }

  void like() {
    _angle = 20;
    _position += Offset(_screenSize.width, 0);
    _showNextCard();

    notifyListeners();
  }

  void disLike() {
    _angle = -20;
    _position -= Offset(_screenSize.width, 0);
    _showNextCard();

    notifyListeners();
  }

  void superLike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _showNextCard();

    notifyListeners();
  }

  Future _showNextCard() async {
    if (_imageUrls.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 300));
    _imageUrls.removeLast();
    resetPosition();
  }
}

enum SwipeType { like, dislike, superLike, nothing }

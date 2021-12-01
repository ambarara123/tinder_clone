import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;
  // Size get screenSize => _screenSize;

  void start(DragStartDetails details){
    _isDragging = true;

    notifyListeners();
  }

  void update(DragUpdateDetails details){
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    //Notify listeners to render UI
    notifyListeners();
  }

  void end(){
    resetPosition();
  }

  void resetPosition(){
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
    notifyListeners();
  }

}
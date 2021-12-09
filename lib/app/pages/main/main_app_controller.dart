import 'dart:ui';

import 'package:get/get.dart';

class MainAppController extends GetxController{
  var pageIndex = 0.obs;
  bool first = true;

  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  Offset get position => _position;

  setPageIndex(index){
    pageIndex.value = index;
  }

  setSecondWidget(){
    first = !first;
    update();
  }
}
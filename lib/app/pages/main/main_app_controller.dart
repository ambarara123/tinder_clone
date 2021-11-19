import 'package:get/get.dart';

class MainAppController extends GetxController{
  var pageIndex = 0.obs;

  setPageIndex(index){
    pageIndex.value = index;
  }
}
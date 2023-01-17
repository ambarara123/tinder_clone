import 'package:get/get.dart';

class TopDestinationNavController extends GetxController {

  RxInt currentBottomNavItemIndex = 0.obs;

  switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
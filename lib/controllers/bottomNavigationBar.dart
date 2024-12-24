import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Reactive index for the currently selected tab
  var currentIndex = 0.obs;

  // Update the selected tab index
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}

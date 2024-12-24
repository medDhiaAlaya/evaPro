import 'package:evapro/controllers/bottomNavigationBar.dart';
import 'package:evapro/screens/evaluate/evaluate_screen.dart';
import 'package:evapro/screens/home/home_screen.dart';
import 'package:evapro/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeScreen(), // Replace with your actual screen
    EvaluateScreen(),
    ProfileScreen() // Replace with your actual screen
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages[bottomNavController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: bottomNavController.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Evaluate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}

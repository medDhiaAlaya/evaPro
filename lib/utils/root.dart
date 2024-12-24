import 'package:evapro/controllers/authController.dart';
import 'package:evapro/controllers/userController.dart';
import 'package:evapro/screens/auth/login.dart';
import 'package:evapro/screens/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure AuthController is initialized
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());

    return Obx(() {
      // Listen to changes in AuthController's user
      final user = Get.find<AuthController>().user;
      if (user != null) {
        return Layout();
      } else {
        return LoginScreen();
      }
    });
  }
}

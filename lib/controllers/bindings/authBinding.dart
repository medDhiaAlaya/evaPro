import 'package:evapro/controllers/authController.dart';
import 'package:get/get.dart';

class Authbinding extends Bindings {
  @override
  void dependencies() {
        Get.put<AuthController>(AuthController(), permanent: true);
  }
}

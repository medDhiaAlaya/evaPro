import 'package:evapro/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);

  UserModel? get user => _userModel.value;

  set user(UserModel? value) => _userModel.value = value;

  void clear() {
    _userModel.value = null;
  }
}

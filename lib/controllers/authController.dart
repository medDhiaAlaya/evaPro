import 'package:evapro/controllers/userController.dart';
import 'package:evapro/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:evapro/services/database.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observing the current Firebase user
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createUser(String name, String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Create a user model and save it to the database
      UserModel newUser = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: userCredential.user!.email!,
      );

      if (await Database().createNewUser(newUser)) {
        Get.find<UserController>().user = newUser;
        Get.back(); // Navigate back after successful creation
      }
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Fetch user details from the database
      UserModel loggedInUser =
          await Database().getUser(userCredential.user!.uid);
      Get.find<UserController>().user = loggedInUser;
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear(); // Clear user data in the app
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

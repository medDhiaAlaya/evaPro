import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evapro/models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print("Error creating new user: $e");
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore.collection("users").doc(uid).get();

      if (doc.exists) {
        // Pass the document snapshot as a positional argument
        return UserModel.fromDocumentSnapshot(doc);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print("Error fetching user: $e");
      rethrow;
    }
  }
}

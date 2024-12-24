import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  // Factory constructor for creating a UserModel from a DocumentSnapshot
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return UserModel(
      id: documentSnapshot.id,
      name: documentSnapshot.data()?["name"] ?? "",
      email: documentSnapshot.data()?["email"] ?? "",
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeUserNameProvider with ChangeNotifier {
  // Provider for editing the userName
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  final currentUser = FirebaseAuth.instance.currentUser;
  String userNameNewValue = "";

  changeUserName({required newUserName}) {
    usersCollection.doc(currentUser!.uid).update({"user_name": newUserName});
    notifyListeners();
  }
}

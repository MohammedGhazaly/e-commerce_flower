import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flower/providers/change_user_name_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showDialogMethod(BuildContext context, {required String oldUserName}) {
  String userNameNewValue = "";
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  final currentUser = FirebaseAuth.instance.currentUser;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              child: Container(
                padding: EdgeInsets.all(22),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<ChangeUserNameProvider>(
                        builder: (context, classInstance, child) {
                      return TextField(
                        onChanged: (value) {
                          userNameNewValue = value;
                        },
                        maxLength: 20,
                        decoration: InputDecoration(
                            hintText: classInstance.userNameNewValue),
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Consumer<ChangeUserNameProvider>(
                            builder: (context, classInstance, child) {
                          return TextButton(
                              onPressed: () {
                                // print(currentUser!.uid);
                                classInstance.userNameNewValue =
                                    userNameNewValue;
                                classInstance.changeUserName(
                                    newUserName: userNameNewValue);

                                Navigator.pop(context);
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(fontSize: 20),
                              ));
                        }),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

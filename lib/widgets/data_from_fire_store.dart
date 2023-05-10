import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flower/providers/change_user_name_provider.dart';
import 'package:e_commerce_flower/widgets/custom_snack_bar.dart';
import 'package:e_commerce_flower/widgets/show_dialog_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetFireStoreData extends StatefulWidget {
  final String documentId;

  const GetFireStoreData({super.key, required this.documentId});
  @override
  State<GetFireStoreData> createState() => _GetFireStoreDataState();
}

class _GetFireStoreDataState extends State<GetFireStoreData> {
  final TextEditingController editUserNameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<ChangeUserNameProvider>(
                      builder: (context, classInstance, child) {
                    // When we first load the page we get the data from server
                    // when we edit we notify the listiner and get the new data
                    return classInstance.userNameNewValue.isEmpty
                        ? Text(
                            "Username: ${data["user_name"]}",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        : Text(
                            "Username: ${classInstance.userNameNewValue}",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          );
                  }),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              users
                                  .doc(currentUser!.uid)
                                  .update({"user_name": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            showDialogMethod(
                              context,
                              oldUserName: data["user_name"],
                            );
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                // "Created date: ${DateFormat.yMd().format(user.metadata.creationTime!)}",
                "Title: ${data["job_title"]}",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                // "Last Signed In: ${DateFormat.yMd().format(user.metadata.lastSignInTime!)}",
                "Age: ${data["age"]}",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          users.doc(currentUser!.uid).delete();
                          currentUser.delete();
                          Navigator.pushReplacementNamed(context, "/loginPage");
                          showSnackBar(
                              bgColor: Colors.red,
                              snackBarMessage: "Account has been deleted",
                              context: context);
                        });
                      },
                      child: Text(
                        "Delete user",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              )
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

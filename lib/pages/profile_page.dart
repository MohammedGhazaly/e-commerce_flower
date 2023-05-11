import 'dart:io';

import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/widgets/data_from_fire_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imgPath;
  uploadImage() async {
    final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, "/loginPage");
            },
            label: Text(
              "logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: appBarGreenColor,
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(125, 78, 91, 110)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      imgPath == null
                          ? CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 225, 225, 225),
                              radius: 70,
                              backgroundImage:
                                  AssetImage("assets/img/avatar.png"),
                            )
                          : ClipOval(
                              child: Image.file(
                                imgPath!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Positioned(
                        bottom: -15,
                        right: -23,
                        child: IconButton(
                            onPressed: () async {
                              await uploadImage();
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 94, 115, 128),
                              size: 32,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 131, 177, 255),
                    borderRadius: BorderRadius.circular(11)),
                child: Text(
                  "Info from firebase Auth",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Email: ${user.email}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    // "Created date: ${DateFormat.yMd().format(user.metadata.creationTime!)}",
                    "Created date: ${DateFormat("MMMM d, y").format(user.metadata.creationTime!)}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    // "Last Signed In: ${DateFormat.yMd().format(user.metadata.lastSignInTime!)}",
                    "Last Signed In: ${DateFormat("MMMM d, y").format(user.metadata.lastSignInTime!)}",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 55,
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 131, 177, 255),
                          borderRadius: BorderRadius.circular(11)),
                      child: Text(
                        "Info from firebase firestore",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),
              GetFireStoreData(documentId: user.uid)
            ],
          ),
        ),
      ),
    );
  }
}

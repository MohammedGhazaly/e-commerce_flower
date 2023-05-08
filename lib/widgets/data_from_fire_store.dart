import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetFireStoreData extends StatelessWidget {
  final String documentId;

  const GetFireStoreData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
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
              Text(
                "Username: ${data["user_name"]}",
                style: TextStyle(
                  fontSize: 17,
                ),
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
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GetFireStoreImage extends StatefulWidget {
  final String documentId;

  const GetFireStoreImage({super.key, required this.documentId});
  @override
  State<GetFireStoreImage> createState() => _GetFireStoreImageState();
}

class _GetFireStoreImageState extends State<GetFireStoreImage> {
  final TextEditingController editUserNameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
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
          return CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(data["profile_img_url"]),
          );
        }

        return Text("loading");
      },
    );
  }
}

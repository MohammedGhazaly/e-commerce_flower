import 'package:flutter/material.dart';

void showSnackBar(
    {required Color bgColor,
    required String snackBarMessage,
    required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: bgColor,
    content: Text(snackBarMessage),
    duration: const Duration(seconds: 4),
  ));
}

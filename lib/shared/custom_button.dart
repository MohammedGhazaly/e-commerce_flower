import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.bgColor, required this.buttonText});
  final Color bgColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}

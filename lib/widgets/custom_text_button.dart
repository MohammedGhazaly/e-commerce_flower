import 'package:e_commerce_flower/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, required this.onPressedFunction});
  final String text;
  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: const TextStyle(color: greenColor, fontSize: 16),
        ));
  }
}

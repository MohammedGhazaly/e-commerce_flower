import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyBoardType,
    required this.isObscured,
    required this.hintText,
  });
  final TextInputType keyBoardType;
  final bool isObscured;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardType,
      obscureText: isObscured,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          filled: true,
          contentPadding: EdgeInsets.all(12)),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.keyBoardType,
      required this.isObscured,
      required this.hintText,
      this.textEditingController,
      this.validatorFunction,
      this.autovalidateMode,
      this.suffixIcon});
  final TextInputType keyBoardType;
  final bool isObscured;
  final String hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validatorFunction;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validatorFunction,
      controller: textEditingController,
      keyboardType: keyBoardType,
      obscureText: isObscured,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          filled: true,
          contentPadding: const EdgeInsets.all(12)),
    );
  }
}

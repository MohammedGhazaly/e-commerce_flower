import 'package:flutter/material.dart';

class TogglePasswordProvider extends ChangeNotifier {
  bool isObscured = true;
  togglePassword({required isObscuredValue}) {
    isObscured = isObscuredValue;

    notifyListeners();
  }
}

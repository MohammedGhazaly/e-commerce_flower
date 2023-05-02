import 'package:flutter/material.dart';

class ProgressIndicatorProvider with ChangeNotifier {
  bool isLoading = false;

  changeProgressIndicator() {
    print("Before: " + isLoading.toString());
    isLoading = !isLoading;
    print("After: " + isLoading.toString());
    notifyListeners();
  }
}

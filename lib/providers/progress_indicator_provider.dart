import 'package:flutter/material.dart';

class ProgressIndicatorProvider with ChangeNotifier {
  bool isLoading = false;

  changeProgressIndicator() {
    isLoading = !isLoading;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int currentIndex = 1;

  void setCurrentIndex(int index) {
    print(index);
    currentIndex = index;
    notifyListeners();
  }
}

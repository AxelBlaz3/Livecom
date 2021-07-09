import 'package:flutter/material.dart';

class SystemViewModel extends ChangeNotifier {
  var languages = {
    "Bahasa Malaysia": false,
    "English (default)": true,
    "中文 (简)": false
  };

  void updateSelectedLanguage(String selectedKey) {
    languages.forEach((key, value) {
      languages[key] = key == selectedKey;
    });

    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class SellerProfileViewModel extends ChangeNotifier {
  bool isSearchTextEmpty = true;
  String searchText = '';

  bool get getIsSearchTextEmpty => isSearchTextEmpty;

  void setSearchText(String newText) {
    this.searchText = newText;
    setIsSearchTextEmpty(this.searchText.isEmpty);
  }

  void setIsSearchTextEmpty(bool isSearchTextEmpty) {
    this.isSearchTextEmpty = isSearchTextEmpty;
    notifyListeners();
  }
}

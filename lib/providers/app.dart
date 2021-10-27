import 'package:flutter/material.dart';

enum SearchBy { PRODUCTS, RESTAURANTS }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy search = SearchBy.RESTAURANTS;
  String filterBy = "Restaurants";

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeSearchBy({SearchBy newSearchBy}) {
    search = newSearchBy;
    if (newSearchBy == SearchBy.RESTAURANTS) {
      filterBy = "Restaurants";
    } else {
      filterBy = "Products";
    }
    notifyListeners();
  }

  notifyListeners();
}

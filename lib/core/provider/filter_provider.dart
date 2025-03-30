import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  List<String> selectedStatuses = [];
  List<String> selectedGenders = [];
  bool sortByAlphabet = true; // true: A-Z, false: Z-A

  void toggleStatus(String status) {
    if (selectedStatuses.contains(status)) {
      selectedStatuses.remove(status);
    } else {
      selectedStatuses.add(status);
    }
    notifyListeners();
  }

  void toggleGender(String gender) {
    if (selectedGenders.contains(gender)) {
      selectedGenders.remove(gender);
    } else {
      selectedGenders.add(gender);
    }
    notifyListeners();
  }

  void setSortByAlphabet(bool value) {
    sortByAlphabet = value;
    notifyListeners();
  }

  void clearFilters() {
    selectedStatuses.clear();
    selectedGenders.clear();
    sortByAlphabet = true;
    notifyListeners();
  }
}

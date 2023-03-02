import 'package:flutter/material.dart';

class FeedbackScreenProvider extends ChangeNotifier {
  String dropdownValue = 'Suggestion';

  void setDropdownValue(String currentDropdownValue) {
    dropdownValue = currentDropdownValue;
    notifyListeners();
  }

}


import 'package:flutter/material.dart';

import '../model/menu_item.dart';

// class MenuProvider with ChangeNotifier {
//   MenuItem? _selectedMenuItem;
//
//   MenuItem? get selectedMenuItem => _selectedMenuItem;
//
//   void selectMenuItem(MenuItem menuItem) {
//     _selectedMenuItem = menuItem;
//     notifyListeners(); // Notify the UI to rebuild when a menu is selected.
//   }
// }



class MenuSelectionProvider with ChangeNotifier {
  MenuItem? _selectedMenuItem;

  MenuItem? get selectedMenuItem => _selectedMenuItem;

  void selectMenuItem(MenuItem menuItem) {
    _selectedMenuItem = menuItem;
    notifyListeners();
  }
}

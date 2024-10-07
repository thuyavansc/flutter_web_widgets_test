
// lib/crud_table/crud_table_controller.dart
import 'package:flutter/material.dart';

class CRUDTableController<T> extends ChangeNotifier {
  List<T> items = [];

  CRUDTableController({required List<T> initialItems}) {
    items = initialItems;
  }

  void addItem(T item) {
    items.add(item);
    notifyListeners();
  }

  void updateItem(T oldItem, T newItem) {
    final index = items.indexOf(oldItem);
    if (index != -1) {
      items[index] = newItem;
      notifyListeners();
    }
  }

  void deleteItem(T item) {
    items.remove(item);
    notifyListeners();
  }
}

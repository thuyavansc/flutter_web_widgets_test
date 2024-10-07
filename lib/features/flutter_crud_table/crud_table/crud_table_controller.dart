
// lib/crud_table/crud_table_controller.dart
import 'package:flutter/material.dart';

import '../data_table/data_table_controller.dart';

// class CRUDTableController<T> extends ChangeNotifier {
//   List<T> items = [];
//
//   CRUDTableController({required List<T> initialItems}) {
//     items = initialItems;
//   }
//
//   void addItem(T item) {
//     items.add(item);
//     notifyListeners();
//   }
//
//   void updateItem(T oldItem, T newItem) {
//     final index = items.indexOf(oldItem);
//     if (index != -1) {
//       items[index] = newItem;
//       notifyListeners();
//     }
//   }
//
//   void deleteItem(T item) {
//     items.remove(item);
//     notifyListeners();
//   }
//
//
// }




class CRUDTableController<T> {
  final DataTableController<T> dataTableController;
  final Future<void> Function(T item) createItem;
  final Future<void> Function(T item) updateItem;
  final Future<void> Function(T item) deleteItem;

  CRUDTableController({
    required this.dataTableController,
    required this.createItem,
    required this.updateItem,
    required this.deleteItem,
  });

  Future<void> addItem(T item) async {
    await createItem(item);
    //await
    dataTableController.refresh();
  }

  Future<void> editItem(T item) async {
    await updateItem(item);
    //await
    dataTableController.refresh();
  }

  Future<void> removeItem(T item) async {
    await deleteItem(item);
    //await
    dataTableController.refresh();
  }
}

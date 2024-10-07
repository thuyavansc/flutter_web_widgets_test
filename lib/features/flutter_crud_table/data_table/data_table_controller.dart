
// lib/data_table/data_table_controller.dart
import 'package:flutter/material.dart';

class DataTableController<T> extends ChangeNotifier {
  List<T> items = [];
  int page = 1;
  int itemsPerPage;
  String searchQuery = '';
  bool isLoading = false;

  DataTableController({
    required List<T> initialItems,
    this.itemsPerPage = 10,
  }) {
    items = initialItems;
  }

  void setPage(int newPage) {
    if (newPage != page) {
      page = newPage;
      notifyListeners();
    }
  }

  void setItemsPerPage(int newItemsPerPage) {
    if (newItemsPerPage != itemsPerPage) {
      itemsPerPage = newItemsPerPage;
      page = 1;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    if (query != searchQuery) {
      searchQuery = query;
      page = 1;
      notifyListeners();
    }
  }

  void setItems(List<T> newItems) {
    items = newItems;
    notifyListeners();
  }

  List<T> get displayedItems {
    List<T> filteredItems = items;
    if (searchQuery.isNotEmpty) {
      filteredItems = items.where((item) => _matchesSearch(item)).toList();
    }

    final startIndex = (page - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredItems.sublist(
      startIndex,
      endIndex > filteredItems.length ? filteredItems.length : endIndex,
    );
  }

  bool _matchesSearch(T item) {
    return item.toString().toLowerCase().contains(searchQuery.toLowerCase());
  }

  int get totalPages {
    final totalItems = searchQuery.isEmpty ? items.length : items.where((item) => _matchesSearch(item)).length;
    return (totalItems / itemsPerPage).ceil();
  }
}

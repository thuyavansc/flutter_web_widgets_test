
// lib/data_table/data_table_controller.dart
import 'package:flutter/material.dart';
import 'dart:async';

// class DataTableController<T> extends ChangeNotifier {
//   List<T> items = [];
//   int page = 1;
//   int itemsPerPage;
//   String searchQuery = '';
//   bool isLoading = false;
//
//   DataTableController({
//     required List<T> initialItems,
//     this.itemsPerPage = 10,
//   }) {
//     items = initialItems;
//   }
//
//   void setPage(int newPage) {
//     if (newPage != page) {
//       page = newPage;
//       notifyListeners();
//     }
//   }
//
//   void setItemsPerPage(int newItemsPerPage) {
//     if (newItemsPerPage != itemsPerPage) {
//       itemsPerPage = newItemsPerPage;
//       page = 1;
//       notifyListeners();
//     }
//   }
//
//   void setSearchQuery(String query) {
//     if (query != searchQuery) {
//       searchQuery = query;
//       page = 1;
//       notifyListeners();
//     }
//   }
//
//   void setItems(List<T> newItems) {
//     items = newItems;
//     notifyListeners();
//   }
//
//   List<T> get displayedItems {
//     List<T> filteredItems = items;
//     if (searchQuery.isNotEmpty) {
//       filteredItems = items.where((item) => _matchesSearch(item)).toList();
//     }
//
//     final startIndex = (page - 1) * itemsPerPage;
//     final endIndex = startIndex + itemsPerPage;
//     return filteredItems.sublist(
//       startIndex,
//       endIndex > filteredItems.length ? filteredItems.length : endIndex,
//     );
//   }
//
//   bool _matchesSearch(T item) {
//     return item.toString().toLowerCase().contains(searchQuery.toLowerCase());
//   }
//
//   int get totalPages {
//     final totalItems = searchQuery.isEmpty ? items.length : items.where((item) => _matchesSearch(item)).length;
//     return (totalItems / itemsPerPage).ceil();
//   }
// }






// typedef DataFetcher<T> = Future<DataPage<T>> Function(int page, int itemsPerPage, String searchQuery);
//
// class DataPage<T> {
//   final List<T> items;
//   final int totalItems;
//
//   DataPage({required this.items, required this.totalItems});
// }
//
// class DataTableController<T> extends ChangeNotifier {
//   final DataFetcher<T>? dataFetcher;
//
//   List<T> _allItems = []; // For local data
//   List<T> _items = [];
//   int _totalItems = 0;
//
//   int _page = 1;
//   int get page => _page;
//
//   int _itemsPerPage;
//   int get itemsPerPage => _itemsPerPage;
//
//   String _searchQuery = '';
//   String get searchQuery => _searchQuery;
//
//   bool isLoading = false;
//
//   Timer? _debounce;
//   final Duration debounceDuration;
//
//   DataTableController({
//     this.dataFetcher,
//     List<T>? initialItems,
//     int initialItemsPerPage = 10,
//     this.debounceDuration = const Duration(seconds: 1),
//   }) : _itemsPerPage = initialItemsPerPage {
//     if (dataFetcher == null && initialItems != null) {
//       _allItems = initialItems;
//       _applyLocalDataFiltering();
//     }
//   }
//
//   List<T> get items => _items;
//
//   int get totalItems => _totalItems;
//
//   int get totalPages => (_totalItems / _itemsPerPage).ceil();
//
//   Future<void> _fetchData() async {
//     if (dataFetcher != null) {
//       // API data fetching
//       isLoading = true;
//       notifyListeners();
//
//       try {
//         final dataPage = await dataFetcher!(_page, _itemsPerPage, _searchQuery);
//         _items = dataPage.items;
//         _totalItems = dataPage.totalItems;
//       } catch (e) {
//         // Handle errors appropriately
//         _items = [];
//         _totalItems = 0;
//       }
//
//       isLoading = false;
//       notifyListeners();
//     } else {
//       // Local data filtering and pagination
//       _applyLocalDataFiltering();
//     }
//   }
//
//   void _applyLocalDataFiltering() {
//     List<T> filteredItems = _allItems;
//     if (_searchQuery.isNotEmpty) {
//       filteredItems = _allItems.where(_matchesSearch).toList();
//     }
//     _totalItems = filteredItems.length;
//
//     final startIndex = (_page - 1) * _itemsPerPage;
//     final endIndex = startIndex + _itemsPerPage;
//     _items = filteredItems.sublist(
//       startIndex,
//       endIndex > filteredItems.length ? filteredItems.length : endIndex,
//     );
//     notifyListeners();
//   }
//
//   bool _matchesSearch(T item) {
//     return item.toString().toLowerCase().contains(_searchQuery.toLowerCase());
//   }
//
//   void setPage(int newPage) {
//     if (newPage != _page && newPage >= 1 && newPage <= totalPages) {
//       _page = newPage;
//       _fetchData();
//     }
//   }
//
//   void setItemsPerPage(int newItemsPerPage) {
//     if (newItemsPerPage != _itemsPerPage && newItemsPerPage > 0) {
//       _itemsPerPage = newItemsPerPage;
//       _page = 1; // Reset to first page
//       _fetchData();
//     }
//   }
//
//   void setSearchQuery0(String query) {
//     if (query != _searchQuery) {
//       _searchQuery = query;
//       _page = 1; // Reset to first page
//       _fetchData();
//     }
//   }
//
//   void setSearchQuery(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(debounceDuration, () {
//       if (query != _searchQuery) {
//         _searchQuery = query;
//         _page = 1; // Reset to first page
//         _fetchData();
//       }
//     });
//   }
//
//
//   void refresh() {
//     _fetchData();
//   }
//
//   // Methods for local data manipulation
//   void setItems(List<T> newItems) {
//     _allItems = newItems;
//     _fetchData();
//   }
//
//   void addItem(T item) {
//     _allItems.add(item);
//     _fetchData();
//   }
//
//   void updateItem(T oldItem, T newItem) {
//     final index = _allItems.indexOf(oldItem);
//     if (index >= 0) {
//       _allItems[index] = newItem;
//       _fetchData();
//     }
//   }
//
//   void deleteItem(T item) {
//     _allItems.remove(item);
//     _fetchData();
//   }
//
//
//   @override
//   void dispose() {
//     _debounce?.cancel(); // Add this line
//     super.dispose();
//   }
//
// }




// lib/controllers/data_table_controller.dart
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// typedef DataFetcher<T> = Future<DataPage<T>> Function(
//     int page, int itemsPerPage, String searchQuery);
//
// class DataPage<T> {
//   final List<T> items;
//   final int totalItems;
//
//   DataPage({required this.items, required this.totalItems});
// }
//
// class DataTableController<T> extends ChangeNotifier {
//   final DataFetcher<T> dataFetcher;
//
//   List<T> _items = [];
//   int _totalItems = 0;
//
//   int _page = 1;
//   int get page => _page;
//
//   int _itemsPerPage;
//   int get itemsPerPage => _itemsPerPage;
//
//   String _searchQuery = '';
//   String get searchQuery => _searchQuery;
//
//   bool isLoading = false;
//
//   Timer? _debounce;
//   final Duration debounceDuration;
//
//   DataTableController({
//     required this.dataFetcher,
//     int initialItemsPerPage = 10,
//     this.debounceDuration = const Duration(seconds: 1),
//   }) : _itemsPerPage = initialItemsPerPage;
//
//   List<T> get items => _items;
//
//   int get totalItems => _totalItems;
//
//   int get totalPages => (_totalItems / _itemsPerPage).ceil();
//
//   Future<void> _fetchData() async {
//     isLoading = true;
//     notifyListeners();
//
//     try {
//       final dataPage =
//       await dataFetcher(_page, _itemsPerPage, _searchQuery);
//       _items = dataPage.items;
//       _totalItems = dataPage.totalItems;
//     } catch (e) {
//       // Handle errors appropriately
//       _items = [];
//       _totalItems = 0;
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
//
//   void setPage(int newPage) {
//     if (newPage != _page &&
//         newPage >= 1 &&
//         newPage <= totalPages) {
//       _page = newPage;
//       _fetchData();
//     }
//   }
//
//   void setItemsPerPage(int newItemsPerPage) {
//     if (newItemsPerPage != _itemsPerPage && newItemsPerPage > 0) {
//       _itemsPerPage = newItemsPerPage;
//       _page = 1; // Reset to first page
//       _fetchData();
//     }
//   }
//
//   void setSearchQuery(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(debounceDuration, () {
//       if (query != _searchQuery) {
//         _searchQuery = query;
//         _page = 1; // Reset to first page
//         _fetchData();
//       }
//     });
//   }
//
//   Future<void> refresh() async {
//     await _fetchData();
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }
// }




// data_table_controller.dart
import 'package:flutter/material.dart';

typedef DataFetcher<T> = Future<DataPage<T>> Function(int page, int itemsPerPage, String searchQuery);

class DataPage<T> {
  final List<T> items;
  final int totalItems;

  DataPage({required this.items, required this.totalItems});
}

class DataTableController<T> extends ChangeNotifier {
  final DataFetcher<T> dataFetcher;
  final Duration debounceDuration;
  Timer? _debounce;

  List<T> _items = [];
  int _totalItems = 0;
  int _page = 1;
  int _itemsPerPage;
  String _searchQuery = '';
  bool isLoading = false;

  DataTableController({
    required this.dataFetcher,
    int initialItemsPerPage = 10,
    this.debounceDuration = const Duration(milliseconds: 500),
  }) : _itemsPerPage = initialItemsPerPage;

  List<T> get items => _items;
  int get totalItems => _totalItems;
  int get page => _page;
  int get itemsPerPage => _itemsPerPage;
  String get searchQuery => _searchQuery;
  int get totalPages => (_totalItems / _itemsPerPage).ceil();

  Future<void> _fetchData() async {
    isLoading = true;
    notifyListeners();

    try {
      final dataPage = await dataFetcher(_page, _itemsPerPage, _searchQuery);
      _items = dataPage.items;
      _totalItems = dataPage.totalItems;
    } catch (e) {
      _items = [];
      _totalItems = 0;
    }

    isLoading = false;
    notifyListeners();
  }

  void setPage(int newPage) {
    if (newPage != _page && newPage >= 1 && newPage <= totalPages) {
      _page = newPage;
      _fetchData();
    }
  }

  void setItemsPerPage(int newItemsPerPage) {
    if (newItemsPerPage != _itemsPerPage && newItemsPerPage > 0) {
      _itemsPerPage = newItemsPerPage;
      _page = 1; // Reset to first page
      _fetchData();
    }
  }

  void setSearchQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(debounceDuration, () {
      if (query != _searchQuery) {
        _searchQuery = query;
        _page = 1; // Reset to first page
        _fetchData();
      }
    });
  }

  void refresh() {
    _fetchData();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}


import 'package:flutter/material.dart';

// class DataProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _data = [];
//   bool _isLoading = false;
//   int _currentPage = 0;
//   final int _pageSize = 10;
//
//   List<Map<String, dynamic>> get data => _data;
//   bool get isLoading => _isLoading;
//
//   Future<void> fetchData({bool isNextPage = false}) async {
//     if (_isLoading) return;
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(seconds: 2)); // Simulating network delay
//
//     List<Map<String, dynamic>> fetchedData = List.generate(_pageSize, (index) {
//       return {
//         'name': 'Item ${_currentPage * _pageSize + index + 1}',
//         'id': _currentPage * _pageSize + index + 1,
//         'action': 'Edit',
//       };
//     });
//
//     if (isNextPage) {
//       _data.addAll(fetchedData);
//     } else {
//       _data = fetchedData;
//     }
//
//     _currentPage++;
//     _isLoading = false;
//     notifyListeners();
//   }
// }



import 'package:flutter/material.dart';

// class DataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _allData = [
//     {'name': 'Item 1', 'id': 1, 'action': 'Edit'},
//     {'name': 'Item 2', 'id': 2, 'action': 'Edit'},
//     {'name': 'Item 3', 'id': 3, 'action': 'Edit'},
//     {'name': 'Item 4', 'id': 4, 'action': 'Edit'},
//     {'name': 'Item 5', 'id': 5, 'action': 'Edit'},
//     {'name': 'Item 6', 'id': 6, 'action': 'Edit'},
//     {'name': 'Item 7', 'id': 7, 'action': 'Edit'},
//     {'name': 'Item 8', 'id': 8, 'action': 'Edit'},
//     {'name': 'Item 9', 'id': 9, 'action': 'Edit'},
//     {'name': 'Item 10', 'id': 10, 'action': 'Edit'},
//     {'name': 'Item 11', 'id': 11, 'action': 'Edit'},
//     {'name': 'Item 12', 'id': 12, 'action': 'Edit'},
//     {'name': 'Item 13', 'id': 13, 'action': 'Edit'},
//     {'name': 'Item 14', 'id': 14, 'action': 'Edit'},
//     {'name': 'Item 15', 'id': 15, 'action': 'Edit'},
//     {'name': 'Item 16', 'id': 16, 'action': 'Edit'},
//     {'name': 'Item 17', 'id': 17, 'action': 'Edit'},
//     {'name': 'Item 18', 'id': 18, 'action': 'Edit'},
//     {'name': 'Item 19', 'id': 19, 'action': 'Edit'},
//     {'name': 'Item 20', 'id': 20, 'action': 'Edit'},
//     {'name': 'Item 21', 'id': 21, 'action': 'Edit'},
//     {'name': 'Item 22', 'id': 22, 'action': 'Edit'},
//     {'name': 'Item 23', 'id': 23, 'action': 'Edit'},
//     {'name': 'Item 24', 'id': 24, 'action': 'Edit'},
//     {'name': 'Item 25', 'id': 25, 'action': 'Edit'},
//     {'name': 'Item 26', 'id': 26, 'action': 'Edit'},
//     {'name': 'Item 27', 'id': 27, 'action': 'Edit'},
//     {'name': 'Item 28', 'id': 28, 'action': 'Edit'},
//     {'name': 'Item 29', 'id': 29, 'action': 'Edit'},
//     {'name': 'Item 30', 'id': 30, 'action': 'Edit'},
//     {'name': 'Item 31', 'id': 31, 'action': 'Edit'},
//     {'name': 'Item 32', 'id': 32, 'action': 'Edit'},
//     {'name': 'Item 33', 'id': 33, 'action': 'Edit'},
//     {'name': 'Item 34', 'id': 34, 'action': 'Edit'},
//     {'name': 'Item 35', 'id': 35, 'action': 'Edit'},
//     {'name': 'Item 36', 'id': 36, 'action': 'Edit'},
//     {'name': 'Item 37', 'id': 37, 'action': 'Edit'},
//     {'name': 'Item 38', 'id': 38, 'action': 'Edit'},
//     {'name': 'Item 39', 'id': 39, 'action': 'Edit'},
//     {'name': 'Item 40', 'id': 40, 'action': 'Edit'},
//     {'name': 'Item 41', 'id': 41, 'action': 'Edit'},
//     {'name': 'Item 42', 'id': 42, 'action': 'Edit'},
//     {'name': 'Item 43', 'id': 43, 'action': 'Edit'},
//     {'name': 'Item 44', 'id': 44, 'action': 'Edit'},
//     {'name': 'Item 45', 'id': 45, 'action': 'Edit'},
//     {'name': 'Item 46', 'id': 46, 'action': 'Edit'},
//     {'name': 'Item 47', 'id': 47, 'action': 'Edit'},
//     {'name': 'Item 48', 'id': 48, 'action': 'Edit'},
//     {'name': 'Item 49', 'id': 49, 'action': 'Edit'},
//     {'name': 'Item 50', 'id': 50, 'action': 'Edit'},
//   ];
//
//   List<Map<String, dynamic>> _pagedData = [];
//   bool _isLoading = false;
//   int _currentPage = 0; // The current page for pagination
//   final int _pageSize = 10; // Default page size
//
//   List<Map<String, dynamic>> get pagedData => _pagedData;
//   bool get isLoading => _isLoading;
//   int get currentPage => _currentPage; // Getter for current page
//
//   // Fetch data based on pagination
//   Future<void> fetchData({required int page, required int pageSize}) async {
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
//
//     int startIndex = page * pageSize;
//     int endIndex = startIndex + pageSize;
//
//     // Ensure we don't exceed the data length
//     if (startIndex < _allData.length) {
//       _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
//     } else {
//       _pagedData = [];
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   // Reset current page
//   void resetPage() {
//     _currentPage = 0;
//     notifyListeners();
//   }
//
//   // Fetch next page
//   Future<void> fetchNextPage() async {
//     _currentPage++;
//     await fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   // Fetch previous page
//   Future<void> fetchPreviousPage() async {
//     if (_currentPage > 0) {
//       _currentPage--;
//       await fetchData(page: _currentPage, pageSize: _pageSize);
//     }
//   }
// }



import 'package:flutter/material.dart';

import '../model/user.dart';

// class DataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _allData = [
//     {'name': 'Item 1', 'id': 1, 'action': 'Edit'},
//     {'name': 'Item 2', 'id': 2, 'action': 'Edit'},
//     {'name': 'Item 3', 'id': 3, 'action': 'Edit'},
//     {'name': 'Item 4', 'id': 4, 'action': 'Edit'},
//     {'name': 'Item 5', 'id': 5, 'action': 'Edit'},
//     {'name': 'Item 6', 'id': 6, 'action': 'Edit'},
//     {'name': 'Item 7', 'id': 7, 'action': 'Edit'},
//     {'name': 'Item 8', 'id': 8, 'action': 'Edit'},
//     {'name': 'Item 9', 'id': 9, 'action': 'Edit'},
//     {'name': 'Item 10', 'id': 10, 'action': 'Edit'},
//     {'name': 'Item 11', 'id': 11, 'action': 'Edit'},
//     {'name': 'Item 12', 'id': 12, 'action': 'Edit'},
//     {'name': 'Item 13', 'id': 13, 'action': 'Edit'},
//     {'name': 'Item 14', 'id': 14, 'action': 'Edit'},
//     {'name': 'Item 15', 'id': 15, 'action': 'Edit'},
//     {'name': 'Item 16', 'id': 16, 'action': 'Edit'},
//     {'name': 'Item 17', 'id': 17, 'action': 'Edit'},
//     {'name': 'Item 18', 'id': 18, 'action': 'Edit'},
//     {'name': 'Item 19', 'id': 19, 'action': 'Edit'},
//     {'name': 'Item 20', 'id': 20, 'action': 'Edit'},
//     {'name': 'Item 21', 'id': 21, 'action': 'Edit'},
//     {'name': 'Item 22', 'id': 22, 'action': 'Edit'},
//     {'name': 'Item 23', 'id': 23, 'action': 'Edit'},
//     {'name': 'Item 24', 'id': 24, 'action': 'Edit'},
//     {'name': 'Item 25', 'id': 25, 'action': 'Edit'},
//     {'name': 'Item 26', 'id': 26, 'action': 'Edit'},
//     {'name': 'Item 27', 'id': 27, 'action': 'Edit'},
//     {'name': 'Item 28', 'id': 28, 'action': 'Edit'},
//     {'name': 'Item 29', 'id': 29, 'action': 'Edit'},
//     {'name': 'Item 30', 'id': 30, 'action': 'Edit'},
//     {'name': 'Item 31', 'id': 31, 'action': 'Edit'},
//     {'name': 'Item 32', 'id': 32, 'action': 'Edit'},
//     {'name': 'Item 33', 'id': 33, 'action': 'Edit'},
//     {'name': 'Item 34', 'id': 34, 'action': 'Edit'},
//     {'name': 'Item 35', 'id': 35, 'action': 'Edit'},
//     {'name': 'Item 36', 'id': 36, 'action': 'Edit'},
//     {'name': 'Item 37', 'id': 37, 'action': 'Edit'},
//     {'name': 'Item 38', 'id': 38, 'action': 'Edit'},
//     {'name': 'Item 39', 'id': 39, 'action': 'Edit'},
//     {'name': 'Item 40', 'id': 40, 'action': 'Edit'},
//     {'name': 'Item 41', 'id': 41, 'action': 'Edit'},
//     {'name': 'Item 42', 'id': 42, 'action': 'Edit'},
//     {'name': 'Item 43', 'id': 43, 'action': 'Edit'},
//     {'name': 'Item 44', 'id': 44, 'action': 'Edit'},
//     {'name': 'Item 45', 'id': 45, 'action': 'Edit'},
//     {'name': 'Item 46', 'id': 46, 'action': 'Edit'},
//     {'name': 'Item 47', 'id': 47, 'action': 'Edit'},
//     {'name': 'Item 48', 'id': 48, 'action': 'Edit'},
//     {'name': 'Item 49', 'id': 49, 'action': 'Edit'},
//     // Add 50 items manually
//     {'name': 'Item 50', 'id': 50, 'action': 'Edit'},
//   ];
//
//   List<Map<String, dynamic>> _pagedData = [];
//   bool _isLoading = false;
//   int _currentPage = 0;
//   final int _pageSize = 10;
//
//   List<Map<String, dynamic>> get pagedData => _pagedData;
//   bool get isLoading => _isLoading;
//   int get currentPage => _currentPage;
//
//   Future<void> fetchData({required int page, required int pageSize}) async {
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
//
//     int startIndex = page * pageSize;
//     int endIndex = startIndex + pageSize;
//
//     if (startIndex < _allData.length) {
//       _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
//     } else {
//       _pagedData = [];
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   void resetPage() {
//     _currentPage = 0;
//     notifyListeners();
//   }
//
//   Future<void> fetchNextPage() async {
//     _currentPage++;
//     await fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   Future<void> fetchPreviousPage() async {
//     if (_currentPage > 0) {
//       _currentPage--;
//       await fetchData(page: _currentPage, pageSize: _pageSize);
//     }
//   }
// }



// class DataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _allData = [
//     {'name': 'Item 1', 'id': 1, 'action': 'Edit'},
//     {'name': 'Item 2', 'id': 2, 'action': 'Edit'},
//     {'name': 'Item 3', 'id': 3, 'action': 'Edit'},
//     {'name': 'Item 4', 'id': 4, 'action': 'Edit'},
//     {'name': 'Item 5', 'id': 5, 'action': 'Edit'},
//     {'name': 'Item 6', 'id': 6, 'action': 'Edit'},
//     {'name': 'Item 7', 'id': 7, 'action': 'Edit'},
//     {'name': 'Item 8', 'id': 8, 'action': 'Edit'},
//     {'name': 'Item 9', 'id': 9, 'action': 'Edit'},
//     {'name': 'Item 10', 'id': 10, 'action': 'Edit'},
//     {'name': 'Item 11', 'id': 11, 'action': 'Edit'},
//     {'name': 'Item 12', 'id': 12, 'action': 'Edit'},
//     {'name': 'Item 13', 'id': 13, 'action': 'Edit'},
//     {'name': 'Item 14', 'id': 14, 'action': 'Edit'},
//     {'name': 'Item 15', 'id': 15, 'action': 'Edit'},
//     {'name': 'Item 16', 'id': 16, 'action': 'Edit'},
//     {'name': 'Item 17', 'id': 17, 'action': 'Edit'},
//     {'name': 'Item 18', 'id': 18, 'action': 'Edit'},
//     {'name': 'Item 19', 'id': 19, 'action': 'Edit'},
//     {'name': 'Item 20', 'id': 20, 'action': 'Edit'},
//     {'name': 'Item 21', 'id': 21, 'action': 'Edit'},
//     {'name': 'Item 22', 'id': 22, 'action': 'Edit'},
//     {'name': 'Item 23', 'id': 23, 'action': 'Edit'},
//     {'name': 'Item 24', 'id': 24, 'action': 'Edit'},
//     {'name': 'Item 25', 'id': 25, 'action': 'Edit'},
//     {'name': 'Item 26', 'id': 26, 'action': 'Edit'},
//     {'name': 'Item 27', 'id': 27, 'action': 'Edit'},
//     {'name': 'Item 28', 'id': 28, 'action': 'Edit'},
//     {'name': 'Item 29', 'id': 29, 'action': 'Edit'},
//     {'name': 'Item 30', 'id': 30, 'action': 'Edit'},
//     {'name': 'Item 31', 'id': 31, 'action': 'Edit'},
//     {'name': 'Item 32', 'id': 32, 'action': 'Edit'},
//     {'name': 'Item 33', 'id': 33, 'action': 'Edit'},
//     {'name': 'Item 34', 'id': 34, 'action': 'Edit'},
//     {'name': 'Item 35', 'id': 35, 'action': 'Edit'},
//     {'name': 'Item 36', 'id': 36, 'action': 'Edit'},
//     {'name': 'Item 37', 'id': 37, 'action': 'Edit'},
//     {'name': 'Item 38', 'id': 38, 'action': 'Edit'},
//     {'name': 'Item 39', 'id': 39, 'action': 'Edit'},
//     {'name': 'Item 40', 'id': 40, 'action': 'Edit'},
//     {'name': 'Item 41', 'id': 41, 'action': 'Edit'},
//     {'name': 'Item 42', 'id': 42, 'action': 'Edit'},
//     {'name': 'Item 43', 'id': 43, 'action': 'Edit'},
//     {'name': 'Item 44', 'id': 44, 'action': 'Edit'},
//     {'name': 'Item 45', 'id': 45, 'action': 'Edit'},
//     {'name': 'Item 46', 'id': 46, 'action': 'Edit'},
//     {'name': 'Item 47', 'id': 47, 'action': 'Edit'},
//     {'name': 'Item 48', 'id': 48, 'action': 'Edit'},
//     {'name': 'Item 49', 'id': 49, 'action': 'Edit'},
//     // Add 50 items manually
//     {'name': 'Item 50', 'id': 50, 'action': 'Edit'},
//   ];
//
//   // Getter for _allData
//   List<Map<String, dynamic>> get allData => _allData;
//
//   List<Map<String, dynamic>> _pagedData = [];
//   bool _isLoading = false;
//   int _currentPage = 0;
//   int _pageSize = 5; // Default page size
//
//   List<Map<String, dynamic>> get pagedData => _pagedData;
//   bool get isLoading => _isLoading;
//   int get currentPage => _currentPage;
//   int get pageSize => _pageSize;
//
//   Future<void> fetchData({required int page, required int pageSize}) async {
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
//
//     int startIndex = page * pageSize;
//     int endIndex = startIndex + pageSize;
//
//     if (startIndex < _allData.length) {
//       _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
//     } else {
//       _pagedData = [];
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   // Method to change page size
//   void changePageSize(int newSize) {
//     _pageSize = newSize;
//     _currentPage = 0;  // Reset page to 0 when changing page size
//     fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   void resetPage() {
//     _currentPage = 0;
//     notifyListeners();
//   }
//
//   Future<void> fetchNextPage() async {
//     _currentPage++;
//     await fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   Future<void> fetchPreviousPage() async {
//     if (_currentPage > 0) {
//       _currentPage--;
//       await fetchData(page: _currentPage, pageSize: _pageSize);
//     }
//   }
// }


// class DataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _allData = [
//     {'name': 'Item 1', 'id': 1, 'action': 'Edit'},
//     {'name': 'Item 2', 'id': 2, 'action': 'Edit'},
//     {'name': 'Item 3', 'id': 3, 'action': 'Edit'},
//     {'name': 'Item 4', 'id': 4, 'action': 'Edit'},
//     {'name': 'Item 5', 'id': 5, 'action': 'Edit'},
//     {'name': 'Item 6', 'id': 6, 'action': 'Edit'},
//     {'name': 'Item 7', 'id': 7, 'action': 'Edit'},
//     {'name': 'Item 8', 'id': 8, 'action': 'Edit'},
//     {'name': 'Item 9', 'id': 9, 'action': 'Edit'},
//     {'name': 'Item 10', 'id': 10, 'action': 'Edit'},
//     {'name': 'Item 11', 'id': 11, 'action': 'Edit'},
//     {'name': 'Item 12', 'id': 12, 'action': 'Edit'},
//     {'name': 'Item 13', 'id': 13, 'action': 'Edit'},
//     {'name': 'Item 14', 'id': 14, 'action': 'Edit'},
//     {'name': 'Item 15', 'id': 15, 'action': 'Edit'},
//     {'name': 'Item 16', 'id': 16, 'action': 'Edit'},
//     {'name': 'Item 17', 'id': 17, 'action': 'Edit'},
//     {'name': 'Item 18', 'id': 18, 'action': 'Edit'},
//     {'name': 'Item 19', 'id': 19, 'action': 'Edit'},
//     {'name': 'Item 20', 'id': 20, 'action': 'Edit'},
//     {'name': 'Item 21', 'id': 21, 'action': 'Edit'},
//     {'name': 'Item 22', 'id': 22, 'action': 'Edit'},
//     {'name': 'Item 23', 'id': 23, 'action': 'Edit'},
//     {'name': 'Item 24', 'id': 24, 'action': 'Edit'},
//     {'name': 'Item 25', 'id': 25, 'action': 'Edit'},
//     {'name': 'Item 26', 'id': 26, 'action': 'Edit'},
//     {'name': 'Item 27', 'id': 27, 'action': 'Edit'},
//     {'name': 'Item 28', 'id': 28, 'action': 'Edit'},
//     {'name': 'Item 29', 'id': 29, 'action': 'Edit'},
//     {'name': 'Item 30', 'id': 30, 'action': 'Edit'},
//     {'name': 'Item 31', 'id': 31, 'action': 'Edit'},
//     {'name': 'Item 32', 'id': 32, 'action': 'Edit'},
//     {'name': 'Item 33', 'id': 33, 'action': 'Edit'},
//     {'name': 'Item 34', 'id': 34, 'action': 'Edit'},
//     {'name': 'Item 35', 'id': 35, 'action': 'Edit'},
//     {'name': 'Item 36', 'id': 36, 'action': 'Edit'},
//     {'name': 'Item 37', 'id': 37, 'action': 'Edit'},
//     {'name': 'Item 38', 'id': 38, 'action': 'Edit'},
//     {'name': 'Item 39', 'id': 39, 'action': 'Edit'},
//     {'name': 'Item 40', 'id': 40, 'action': 'Edit'},
//     {'name': 'Item 41', 'id': 41, 'action': 'Edit'},
//     {'name': 'Item 42', 'id': 42, 'action': 'Edit'},
//     {'name': 'Item 43', 'id': 43, 'action': 'Edit'},
//     {'name': 'Item 44', 'id': 44, 'action': 'Edit'},
//     {'name': 'Item 45', 'id': 45, 'action': 'Edit'},
//     {'name': 'Item 46', 'id': 46, 'action': 'Edit'},
//     {'name': 'Item 47', 'id': 47, 'action': 'Edit'},
//     {'name': 'Item 48', 'id': 48, 'action': 'Edit'},
//     {'name': 'Item 49', 'id': 49, 'action': 'Edit'},
//     // Add 50 items manually
//     {'name': 'Item 50', 'id': 50, 'action': 'Edit'},
//   ];
//
//   // Getter for _allData
//   List<Map<String, dynamic>> get allData => _allData;
//
//   List<Map<String, dynamic>> _pagedData = [];
//   bool _isLoading = false;
//   int _currentPage = 0;
//   int _pageSize = 5; // Default page size
//
//   List<Map<String, dynamic>> get pagedData => _pagedData;
//   bool get isLoading => _isLoading;
//   int get currentPage => _currentPage;
//   int get pageSize => _pageSize;
//
//   Future<void> fetchData({required int page, required int pageSize}) async {
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
//
//     int startIndex = page * pageSize;
//     int endIndex = startIndex + pageSize;
//
//     if (startIndex < _allData.length) {
//       _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
//     } else {
//       _pagedData = [];
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   // Method to change page size but retain the current item range
//   void changePageSize(int newSize) {
//     int currentFirstItemIndex = _currentPage * _pageSize; // Get the index of the first item in the current view
//     _pageSize = newSize;
//     _currentPage = currentFirstItemIndex ~/ _pageSize; // Calculate new current page based on new page size
//     fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   void resetPage() {
//     _currentPage = 0;
//     notifyListeners();
//   }
//
//   Future<void> fetchNextPage() async {
//     _currentPage++;
//     await fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   Future<void> fetchPreviousPage() async {
//     if (_currentPage > 0) {
//       _currentPage--;
//       await fetchData(page: _currentPage, pageSize: _pageSize);
//     }
//   }
// }






// class DataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _allData = List.generate(50, (index) {
//     return {'name': 'Item ${index + 1}', 'id': index + 1, 'action': 'Edit'};
//   });
//
//   List<Map<String, dynamic>> _pagedData = [];
//   bool _isLoading = false;
//   int _currentPage = 0;
//   int _pageSize = 5; // Default page size
//
//   Set<int> _selectedRowIds = Set();
//
//   List<Map<String, dynamic>> get pagedData => _pagedData;
//   List<Map<String, dynamic>> get allData => _allData;
//   bool get isLoading => _isLoading;
//   int get currentPage => _currentPage;
//   int get pageSize => _pageSize;
//   Set<int> get selectedRowIds => _selectedRowIds;
//
//   Future<void> fetchData({required int page, required int pageSize}) async {
//     _isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
//
//     int startIndex = page * pageSize;
//     int endIndex = startIndex + pageSize;
//
//     if (startIndex < _allData.length) {
//       _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
//     } else {
//       _pagedData = [];
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
//
//   void toggleRowSelection(int id) {
//     if (_selectedRowIds.contains(id)) {
//       _selectedRowIds.remove(id);
//     } else {
//       _selectedRowIds.add(id);
//     }
//     notifyListeners();
//   }
//
//   void changePageSize(int newSize) {
//     int currentFirstItemIndex = _currentPage * _pageSize; // Get the index of the first item in the current view
//     _pageSize = newSize;
//     _currentPage = currentFirstItemIndex ~/ _pageSize; // Calculate new current page based on new page size
//     fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   Future<void> fetchNextPage() async {
//     _currentPage++;
//     await fetchData(page: _currentPage, pageSize: _pageSize);
//   }
//
//   Future<void> fetchPreviousPage() async {
//     if (_currentPage > 0) {
//       _currentPage--;
//       await fetchData(page: _currentPage, pageSize: _pageSize);
//     }
//   }
// }






class DataProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _allData = List.generate(50, (index) {
    return {
      'id': index+1,
      'deviceName': 'Device ${index + 1}',
      'image': index % 2 == 0 ? 'https://example.com/image${index + 1}.png' : null, // Example image URL
      'manufacturer': 'Manufacturer ${index + 1}',
      'model': 'Model ${index + 1}',
      'osVersion': 'Android 11',
      'batteryPercentage': (index + 1) * 2, // Example battery percentage
      'availableMemory': '${(index + 1) * 1}GB', // Example available memory
      'availableMemoryPercentage': 75, // Example percentage for memory usage
      'phoneNumber': '123-456-789${index}',
      'action': 'Edit'
    };
  });

  List<Map<String, dynamic>> _pagedData = [];
  bool _isLoading = false;
  int _currentPage = 0;
  int _pageSize = 5; // Default page size

  Set<int> _selectedRowIds = Set();

  List<Map<String, dynamic>> get pagedData => _pagedData;
  List<Map<String, dynamic>> get allData => _allData;
  bool get isLoading => _isLoading;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  Set<int> get selectedRowIds => _selectedRowIds;

  Future<void> fetchData({required int page, required int pageSize}) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay

    int startIndex = page * pageSize;
    int endIndex = startIndex + pageSize;

    if (startIndex < _allData.length) {
      _pagedData = _allData.sublist(startIndex, endIndex > _allData.length ? _allData.length : endIndex);
    } else {
      _pagedData = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleRowSelection(int id) {
    if (_selectedRowIds.contains(id)) {
      _selectedRowIds.remove(id);
    } else {
      _selectedRowIds.add(id);
    }
    notifyListeners();
  }

  void changePageSize(int newSize) {
    int currentFirstItemIndex = _currentPage * _pageSize; // Get the index of the first item in the current view
    _pageSize = newSize;
    _currentPage = currentFirstItemIndex ~/ _pageSize; // Calculate new current page based on new page size
    fetchData(page: _currentPage, pageSize: _pageSize);
  }

  Future<void> fetchNextPage() async {
    _currentPage++;
    await fetchData(page: _currentPage, pageSize: _pageSize);
  }

  Future<void> fetchPreviousPage() async {
    if (_currentPage > 0) {
      _currentPage--;
      await fetchData(page: _currentPage, pageSize: _pageSize);
    }
  }
}
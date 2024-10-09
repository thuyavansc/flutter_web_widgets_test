import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

// class DataPageV1 extends StatefulWidget {
//   // Main page displaying the responsive table
//   @override
//   _DataPageV1State createState() => _DataPageV1State();
// }
//
// class _DataPageV1State extends State<DataPageV1> {
//   late List<DatatableHeader> _headers;
//
//   // Pagination variables
//   final List<int> _perPages = [10, 20, 50, 100];
//   int _total = 0;
//   int _currentPerPage = 10;
//   int _currentPage = 1;
//
//   // Data sources
//   List<Map<String, dynamic>> _sourceOriginal = [];
//   List<Map<String, dynamic>> _sourceFiltered = [];
//   List<Map<String, dynamic>> _source = [];
//
//   // Loading state
//   bool _isLoading = true;
//
//   // Sorting
//   String? _sortColumn;
//   bool _sortAscending = true;
//
//   // Search
//   bool _isSearch = false;
//   String? _searchKey = "id";
//
//   // Selected rows
//   List<Map<String, dynamic>> _selecteds = [];
//
//   // Random number generator for mock data
//   final Random _random = Random();
//
//   @override
//   void initState() {
//     super.initState();
//     _setupHeaders();
//     _initializeData();
//   }
//
//   void _setupHeaders() {
//     _headers = [
//       DatatableHeader(
//         text: "ID",
//         value: "id",
//         show: true,
//         sortable: true,
//         textAlign: TextAlign.center,
//       ),
//       DatatableHeader(
//         text: "Name",
//         value: "name",
//         show: true,
//         flex: 2,
//         sortable: true,
//         textAlign: TextAlign.left,
//       ),
//       DatatableHeader(
//         text: "SKU",
//         value: "sku",
//         show: true,
//         sortable: true,
//         textAlign: TextAlign.center,
//       ),
//       DatatableHeader(
//         text: "Category",
//         value: "category",
//         show: true,
//         sortable: true,
//         textAlign: TextAlign.left,
//       ),
//       DatatableHeader(
//         text: "Price",
//         value: "price",
//         show: true,
//         sortable: true,
//         textAlign: TextAlign.right,
//       ),
//       // Add more headers as needed
//     ];
//   }
//
//   List<Map<String, dynamic>> _generateData({int count = 100}) {
//     List<Map<String, dynamic>> data = [];
//     for (int i = 1; i <= count; i++) {
//       data.add({
//         "id": i,
//         "name": "Product $i",
//         "sku": "SKU$i${_random.nextInt(999)}",
//         "category": "Category ${_random.nextInt(10) + 1}",
//         "price": (_random.nextDouble() * 100).toStringAsFixed(2),
//         // Add more fields as needed
//       });
//     }
//     return data;
//   }
//
//   Future<void> _initializeData() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     // Simulate data fetching delay
//     await Future.delayed(Duration(seconds: 2));
//
//     _sourceOriginal = _generateData(count: 1000); // Generate 1000 rows
//     _sourceFiltered = List.from(_sourceOriginal);
//     _total = _sourceFiltered.length;
//     _updateSource();
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   void _updateSource() {
//     int start = (_currentPage - 1) * _currentPerPage;
//     int end = start + _currentPerPage;
//     if (end > _total) end = _total;
//     _source = _sourceFiltered.sublist(start, end);
//   }
//
//   void _onSort(String columnName) {
//     setState(() {
//       if (_sortColumn == columnName) {
//         _sortAscending = !_sortAscending;
//       } else {
//         _sortColumn = columnName;
//         _sortAscending = true;
//       }
//
//       _sourceFiltered.sort((a, b) {
//         var aValue = a[columnName];
//         var bValue = b[columnName];
//
//         if (aValue is num && bValue is num) {
//           return _sortAscending
//               ? aValue.compareTo(bValue)
//               : bValue.compareTo(aValue);
//         } else {
//           return _sortAscending
//               ? aValue.toString().compareTo(bValue.toString())
//               : bValue.toString().compareTo(aValue.toString());
//         }
//       });
//
//       _currentPage = 1;
//       _updateSource();
//     });
//   }
//
//   void _onSearch(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _sourceFiltered = List.from(_sourceOriginal);
//       } else {
//         _sourceFiltered = _sourceOriginal
//             .where((item) =>
//             item[_searchKey!].toString().toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//       _total = _sourceFiltered.length;
//       _currentPage = 1;
//       _updateSource();
//     });
//   }
//
//   void _onChangePerPage(int? value) {
//     if (value != null) {
//       setState(() {
//         _currentPerPage = value;
//         _currentPage = 1;
//         _updateSource();
//       });
//     }
//   }
//
//   void _onNextPage() {
//     if ((_currentPage * _currentPerPage) < _total) {
//       setState(() {
//         _currentPage += 1;
//         _updateSource();
//       });
//     }
//   }
//
//   void _onPreviousPage() {
//     if (_currentPage > 1) {
//       setState(() {
//         _currentPage -= 1;
//         _updateSource();
//       });
//     }
//   }
//
//   void _onRefresh() {
//     _initializeData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Responsive Table with Pagination"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: _onRefresh,
//             tooltip: 'Refresh Data',
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 _isSearch
//                     ? Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText:
//                       'Search by ${_searchKey!.toUpperCase()}',
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.cancel),
//                         onPressed: () {
//                           setState(() {
//                             _isSearch = false;
//                             _onSearch('');
//                           });
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     onSubmitted: _onSearch,
//                   ),
//                 )
//                     : TextButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       _isSearch = true;
//                     });
//                   },
//                   icon: Icon(Icons.search),
//                   label: Text("Search"),
//                 ),
//                 SizedBox(width: 10),
//                 // Additional actions can be added here
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: ResponsiveDatatable(
//                 headers: _headers,
//                 source: _source,
//                 selecteds: _selecteds,
//                 showSelect: true,
//                 autoHeight: false,
//                 onSort: (value) => _onSort(value),
//                 sortColumn: _sortColumn,
//                 sortAscending: _sortAscending,
//                 onSelect: (selected, item) {
//                   setState(() {
//                     if (selected!) {
//                       _selecteds.add(item);
//                     } else {
//                       _selecteds.remove(item);
//                     }
//                   });
//                 },
//                 onSelectAll: (selected) {
//                   setState(() {
//                     if (selected!) {
//                       _selecteds = List.from(_source);
//                     } else {
//                       _selecteds.clear();
//                     }
//                   });
//                 },
//                 footers: [
//                   // Pagination Controls
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//                         Text("Rows per page: "),
//                         DropdownButton<int>(
//                           value: _currentPerPage,
//                           items: _perPages
//                               .map((e) => DropdownMenuItem<int>(
//                             child: Text("$e"),
//                             value: e,
//                           ))
//                               .toList(),
//                           onChanged: _onChangePerPage,
//                         ),
//                         Spacer(),
//                         Text(
//                             "Page $_currentPage of ${(_total / _currentPerPage).ceil()}"),
//                         IconButton(
//                           icon: Icon(Icons.arrow_back),
//                           onPressed:
//                           _currentPage > 1 ? _onPreviousPage : null,
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.arrow_forward),
//                           onPressed: (_currentPage * _currentPerPage) <
//                               _total
//                               ? _onNextPage
//                               : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//                 // Optional: Customize row tapping
//                 onTabRow: (data) {
//                   // Handle row tap if needed
//                   print("Tapped row: $data");
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _onRefresh,
//         child: Icon(Icons.refresh),
//         tooltip: 'Refresh Data',
//       ),
//     );
//   }
// }



// class DataPageV1 extends StatefulWidget {
//   DataPageV1({Key? key}) : super(key: key);
//   @override
//   _DataPageState createState() => _DataPageState();
// }
//
// class _DataPageState extends State<DataPageV1> {
//   late List<DatatableHeader> _headers;
//
//   final List<int> _perPages = [5,10, 20, 50, 100];
//   int _total = 100;
//   int? _currentPerPage = 10;
//   List<bool>? _expanded;
//   String? _searchKey = "id";
//
//   int _currentPage = 1;
//   bool _isSearch = false;
//   List<Map<String, dynamic>> _sourceOriginal = [];
//   List<Map<String, dynamic>> _sourceFiltered = [];
//   List<Map<String, dynamic>> _source = [];
//   List<Map<String, dynamic>> _selecteds = [];
//   // ignore: unused_field
//   String _selectableKey = "id";
//
//   String? _sortColumn;
//   bool _sortAscending = true;
//   bool _isLoading = true;
//   bool _showSelect = true;
//   var random = new Random();
//
//   List<Map<String, dynamic>> _generateData({int n = 100}) {
//     final List source = List.filled(n, Random.secure());
//     List<Map<String, dynamic>> temps = [];
//     var i = 1;
//     print(i);
//     // ignore: unused_local_variable
//     for (var data in source) {
//       temps.add({
//         "id": i,
//         "sku": "$i\000$i",
//         "name": "Product $i",
//         "category": "Category-$i",
//         "price": i * 10.00,
//         "cost": "20.00",
//         "margin": "${i}0.20",
//         "in_stock": "${i}0",
//         "alert": "5",
//         "received": [i + 20, 150]
//       });
//       i++;
//     }
//     return temps;
//   }
//
//   _initializeData() async {
//     _mockPullData();
//   }
//
//   _mockPullData() async {
//     _expanded = List.generate(_currentPerPage!, (index) => false);
//
//     setState(() => _isLoading = true);
//     Future.delayed(Duration(seconds: 3)).then((value) {
//       _sourceOriginal.clear();
//       _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
//       _sourceFiltered = _sourceOriginal;
//       _total = _sourceFiltered.length;
//       _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
//       setState(() => _isLoading = false);
//     });
//   }
//
//   _resetData({start = 0}) async {
//     setState(() => _isLoading = true);
//     var _expandedLen =
//     _total - start < _currentPerPage! ? _total - start : _currentPerPage;
//     Future.delayed(Duration(seconds: 0)).then((value) {
//       _expanded = List.generate(_expandedLen as int, (index) => false);
//       _source.clear();
//       _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
//       setState(() => _isLoading = false);
//     });
//   }
//
//   _filterData(value) {
//     setState(() => _isLoading = true);
//
//     try {
//       if (value == "" || value == null) {
//         _sourceFiltered = _sourceOriginal;
//       } else {
//         _sourceFiltered = _sourceOriginal
//             .where((data) => data[_searchKey!]
//             .toString()
//             .toLowerCase()
//             .contains(value.toString().toLowerCase()))
//             .toList();
//       }
//
//       _total = _sourceFiltered.length;
//       var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
//       _expanded = List.generate(_rangeTop, (index) => false);
//       _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//     } catch (e) {
//       print(e);
//     }
//     setState(() => _isLoading = false);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     /// set headers
//     _headers = [
//       DatatableHeader(
//           text: "ID",
//           value: "id",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Name",
//           value: "name",
//           show: true,
//           flex: 2,
//           sortable: true,
//           editable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "SKU",
//           value: "sku",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Category",
//           value: "category",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Price",
//           value: "price",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Margin",
//           value: "margin",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "In Stock",
//           value: "in_stock",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Alert",
//           value: "alert",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Received",
//           value: "received",
//           show: true,
//           sortable: false,
//           sourceBuilder: (value, row) {
//             List list = List.from(value);
//             return Container(
//               child: Column(
//                 children: [
//                   Container(
//                     width: 85,
//                     child: LinearProgressIndicator(
//                       value: list.first / list.last,
//                     ),
//                   ),
//                   Text("${list.first} of ${list.last}")
//                 ],
//               ),
//             );
//           },
//           textAlign: TextAlign.center),
//     ];
//
//     _initializeData();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("RESPONSIVE DATA TABLE"),
//         actions: [
//           IconButton(
//             onPressed: _initializeData,
//             icon: Icon(Icons.refresh_sharp),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("home"),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.storage),
//               title: Text("data"),
//               onTap: () {},
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.all(0),
//                   constraints: BoxConstraints(
//                     maxHeight: 700,
//                   ),
//                   child: Card(
//                     elevation: 1,
//                     shadowColor: Colors.black,
//                     clipBehavior: Clip.none,
//                     child: ResponsiveDatatable(
//                       title: TextButton.icon(
//                         onPressed: () => {},
//                         icon: Icon(Icons.add),
//                         label: Text("new item"),
//                       ),
//                       reponseScreenSizes: [ScreenSize.xs],
//                       actions: [
//                         if (_isSearch)
//                           Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     hintText: 'Enter search term based on ' +
//                                         _searchKey!
//                                             .replaceAll(new RegExp('[\\W_]+'), ' ')
//                                             .toUpperCase(),
//                                     prefixIcon: IconButton(
//                                         icon: Icon(Icons.cancel),
//                                         onPressed: () {
//                                           setState(() {
//                                             _isSearch = false;
//                                           });
//                                           _initializeData();
//                                         }),
//                                     suffixIcon: IconButton(
//                                         icon: Icon(Icons.search), onPressed: () {})),
//                                 onSubmitted: (value) {
//                                   _filterData(value);
//                                 },
//                               )),
//                         if (!_isSearch)
//                           IconButton(
//                               icon: Icon(Icons.search),
//                               onPressed: () {
//                                 setState(() {
//                                   _isSearch = true;
//                                 });
//                               })
//                       ],
//                       headers: _headers,
//                       source: _source,
//                       selecteds: _selecteds,
//                       showSelect: _showSelect,
//                       autoHeight: false,
//                       dropContainer: (data) {
//                         if (int.tryParse(data['id'].toString())!.isEven) {
//                           return Text("is Even");
//                         }
//                         return _DropDownContainer(data: data);
//                       },
//                       onChangedRow: (value, header) {
//                         /// print(value);
//                         /// print(header);
//                       },
//                       onSubmittedRow: (value, header) {
//                         /// print(value);
//                         /// print(header);
//                       },
//                       onTabRow: (data) {
//                         print(data);
//                       },
//                       onSort: (value) {
//                         setState(() => _isLoading = true);
//
//                         setState(() {
//                           _sortColumn = value;
//                           _sortAscending = !_sortAscending;
//                           if (_sortAscending) {
//                             _sourceFiltered.sort((a, b) =>
//                                 b["$_sortColumn"].compareTo(a["$_sortColumn"]));
//                           } else {
//                             _sourceFiltered.sort((a, b) =>
//                                 a["$_sortColumn"].compareTo(b["$_sortColumn"]));
//                           }
//                           var _rangeTop = _currentPerPage! < _sourceFiltered.length
//                               ? _currentPerPage!
//                               : _sourceFiltered.length;
//                           _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//                           _searchKey = value;
//
//                           _isLoading = false;
//                         });
//                       },
//                       expanded: _expanded,
//                       sortAscending: _sortAscending,
//                       sortColumn: _sortColumn,
//                       isLoading: _isLoading,
//                       onSelect: (value, item) {
//                         print("$value  $item ");
//                         if (value!) {
//                           setState(() => _selecteds.add(item));
//                         } else {
//                           setState(
//                                   () => _selecteds.removeAt(_selecteds.indexOf(item)));
//                         }
//                       },
//                       onSelectAll: (value) {
//                         if (value!) {
//                           setState(() => _selecteds =
//                               _source.map((entry) => entry).toList().cast());
//                         } else {
//                           setState(() => _selecteds.clear());
//                         }
//                       },
//                       footers: [
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child: Text("Rows per page:"),
//                         ),
//                         if (_perPages.isNotEmpty)
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 15),
//                             child: DropdownButton<int>(
//                               value: _currentPerPage,
//                               items: _perPages
//                                   .map((e) => DropdownMenuItem<int>(
//                                 child: Text("$e"),
//                                 value: e,
//                               ))
//                                   .toList(),
//                               onChanged: (dynamic value) {
//                                 setState(() {
//                                   _currentPerPage = value;
//                                   _currentPage = 1;
//                                   _resetData();
//                                 });
//                               },
//                               isExpanded: false,
//                             ),
//                           ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child:
//                           Text("$_currentPage - $_currentPerPage of $_total"),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             Icons.arrow_back_ios,
//                             size: 16,
//                           ),
//                           onPressed: _currentPage == 1
//                               ? null
//                               : () {
//                             var _nextSet = _currentPage - _currentPerPage!;
//                             setState(() {
//                               _currentPage = _nextSet > 1 ? _nextSet : 1;
//                               _resetData(start: _currentPage - 1);
//                             });
//                           },
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.arrow_forward_ios, size: 16),
//                           onPressed: _currentPage + _currentPerPage! - 1 > _total
//                               ? null
//                               : () {
//                             var _nextSet = _currentPage + _currentPerPage!;
//
//                             setState(() {
//                               _currentPage = _nextSet < _total
//                                   ? _nextSet
//                                   : _total - _currentPerPage!;
//                               _resetData(start: _nextSet - 1);
//                             });
//                           },
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                         )
//                       ],
//                       headerDecoration: BoxDecoration(
//                           color: Colors.grey,
//                           border: Border(
//                               bottom: BorderSide(color: Colors.red, width: 1))),
//                       selectedDecoration: BoxDecoration(
//                         border: Border(
//                             bottom:
//                             BorderSide(color: Colors.green[300]!, width: 1)),
//                         color: Colors.green,
//                       ),
//                       headerTextStyle: TextStyle(color: Colors.white),
//                       rowTextStyle: TextStyle(color: Colors.green),
//                       selectedTextStyle: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ])),
//     );
//   }
// }
//
// class _DropDownContainer extends StatelessWidget {
//   final Map<String, dynamic> data;
//   const _DropDownContainer({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _children = data.entries.map<Widget>((entry) {
//       Widget w = Row(
//         children: [
//           Text(entry.key.toString()),
//           Spacer(),
//           Text(entry.value.toString()),
//         ],
//       );
//       return w;
//     }).toList();
//
//     return Container(
//       /// height: 100,
//       child: Column(
//         /// children: [
//         ///   Expanded(
//         ///       child: Container(
//         ///     color: Colors.red,
//         ///     height: 50,
//         ///   )),
//         /// ],
//         children: _children,
//       ),
//     );
//   }
// }





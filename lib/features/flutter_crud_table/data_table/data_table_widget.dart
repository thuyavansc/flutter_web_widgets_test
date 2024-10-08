
// lib/data_table/data_table_widget.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import 'data_table_controller.dart';
import 'pagination_widget.dart';

// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool expandable;
//   final Widget Function(T item)? expandedBuilder;
//   final Function(T item, String query)? searchMatcher;
//   final Function(T item)? onRowTap;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.expandable = false,
//     this.expandedBuilder,
//     this.searchMatcher,
//     this.onRowTap,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> expandedItems = {};
//   Set<T> selectedItems = {};
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   bool _matchesSearch(T item) {
//     if (widget.controller.searchQuery.isEmpty) {
//       return true;
//     }
//     if (widget.searchMatcher != null) {
//       return widget.searchMatcher!(item, widget.controller.searchQuery);
//     }
//     return item.toString().toLowerCase().contains(widget.controller.searchQuery.toLowerCase());
//   }
//
//   void _toggleExpanded(T item) {
//     setState(() {
//       if (expandedItems.contains(item)) {
//         expandedItems.remove(item);
//       } else {
//         expandedItems.add(item);
//       }
//     });
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<T> filteredItems = widget.controller.items.where(_matchesSearch).toList();
//     widget.controller.items = filteredItems;
//
//     final displayedItems = widget.controller.displayedItems;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 widget.controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Table headers
//         Container(
//           color: Theme.of(context).dividerColor,
//           child: Row(
//             children: [
//               if (widget.selectable)
//                 const SizedBox(
//                   width: 48,
//                   child: Center(child: Text('Select')),
//                 ),
//               ...widget.headers.map((header) {
//                 return Expanded(
//                   flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       header.name,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//         // Table rows
//         Expanded(
//           child: ListView.builder(
//             itemCount: displayedItems.length,
//             itemBuilder: (context, index) {
//               final item = displayedItems[index];
//               final isExpanded = expandedItems.contains(item);
//               final isSelected = selectedItems.contains(item);
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: widget.onRowTap != null
//                         ? () {
//                       widget.onRowTap!(item);
//                     }
//                         : null,
//                     child: Container(
//                       color: isExpanded ? Colors.grey[200] : null,
//                       child: Row(
//                         children: [
//                           if (widget.selectable)
//                             SizedBox(
//                               width: 48,
//                               child: Checkbox(
//                                 value: isSelected,
//                                 onChanged: (value) {
//                                   _toggleSelected(item);
//                                 },
//                               ),
//                             ),
//                           ...widget.headers.map((header) {
//                             Widget content;
//                             if (header.widgetBuilder != null) {
//                               content = header.widgetBuilder!(item);
//                             } else if (header.valueGetter != null) {
//                               final value = header.valueGetter!(item);
//                               content = Text(value);
//                             } else {
//                               content = const SizedBox();
//                             }
//                             return Expanded(
//                               flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: content,
//                               ),
//                             );
//                           }).toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (isExpanded && widget.expandedBuilder != null)
//                     widget.expandedBuilder!(item),
//                 ],
//               );
//             },
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: widget.controller),
//       ],
//     );
//   }
// }




// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool selectable;
//   final Function(T item)? onRowTap;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.selectable = false,
//     this.onRowTap,
//     this.selectedItems,
//     this.onSelectionChanged,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : ListView.builder(
//             itemCount: controller.items.length,
//             itemBuilder: (context, index) {
//               final item = controller.items[index];
//               final isSelected = selectedItems.contains(item);
//               return GestureDetector(
//                 onTap: widget.onRowTap != null
//                     ? () {
//                   widget.onRowTap!(item);
//                 }
//                     : null,
//                 child: Container(
//                   color: isSelected ? Colors.grey[300] : null,
//                   child: Row(
//                     children: [
//                       if (widget.selectable)
//                         SizedBox(
//                           width: 48,
//                           child: Checkbox(
//                             value: isSelected,
//                             onChanged: (value) {
//                               _toggleSelected(item);
//                             },
//                           ),
//                         ),
//                       ...widget.headers.map((header) {
//                         Widget content;
//                         if (header.widgetBuilder != null) {
//                           content = header.widgetBuilder!(item);
//                         } else if (header.valueGetter != null) {
//                           final value = header.valueGetter!(item);
//                           content = Text(value);
//                         } else {
//                           content = const SizedBox();
//                         }
//                         return Expanded(
//                           flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: content,
//                           ),
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
// }



// data_table_widget.dart
import 'package:flutter/material.dart';
import 'data_table_controller.dart';

// typedef ValueGetter<T> = String Function(T item);
// typedef WidgetBuilderFunction<T> = Widget Function(T item);
//
// class TableHeader<T> {
//   final String name;
//   final ValueGetter<T>? valueGetter;
//   final WidgetBuilderFunction<T>? widgetBuilder;
//   final double? width;
//
//   TableHeader({
//     required this.name,
//     this.valueGetter,
//     this.widgetBuilder,
//     this.width,
//   });
// }





// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : ListView.builder(
//             itemCount: controller.items.length,
//             itemBuilder: (context, index) {
//               final item = controller.items[index];
//               return Row(
//                 children: widget.headers.map((header) {
//                   Widget content;
//                   if (header.widgetBuilder != null) {
//                     content = header.widgetBuilder!(item);
//                   } else if (header.valueGetter != null) {
//                     final value = header.valueGetter!(item);
//                     content = Text(value);
//                   } else {
//                     content = const SizedBox();
//                   }
//                   return Expanded(
//                     flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: content,
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
// }
//
// class PaginationWidget<T> extends StatelessWidget {
//   final DataTableController<T> controller;
//
//   const PaginationWidget({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final totalPages = controller.totalPages;
//     final currentPage = controller.page;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: totalPages > 1
//           ? Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Items per page dropdown
//           Row(
//             children: [
//               const Text('Items per page: '),
//               DropdownButton<int>(
//                 value: controller.itemsPerPage,
//                 items: [5, 10, 15, 25, 50].map((value) {
//                   return DropdownMenuItem(
//                     value: value,
//                     child: Text('$value'),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.setItemsPerPage(value);
//                   }
//                 },
//               ),
//             ],
//           ),
//           // Pagination buttons
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.first_page),
//                 onPressed: currentPage > 1
//                     ? () {
//                   controller.setPage(1);
//                 }
//                     : null,
//               ),
//               IconButton(
//                 icon: const Icon(Icons.chevron_left),
//                 onPressed: currentPage > 1
//                     ? () {
//                   controller.setPage(currentPage - 1);
//                 }
//                     : null,
//               ),
//               Text('Page $currentPage of $totalPages'),
//               IconButton(
//                 icon: const Icon(Icons.chevron_right),
//                 onPressed: currentPage < totalPages
//                     ? () {
//                   controller.setPage(currentPage + 1);
//                 }
//                     : null,
//               ),
//               IconButton(
//                 icon: const Icon(Icons.last_page),
//                 onPressed: currentPage < totalPages
//                     ? () {
//                   controller.setPage(totalPages);
//                 }
//                     : null,
//               ),
//             ],
//           ),
//         ],
//       )
//           : Container(), // Hide pagination if only one page
//     );
//   }
// }




// data_table_widget.dart
import 'package:flutter/material.dart';
import 'data_table_controller.dart';


// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // New optional parameters
//   final bool expandable;
//   final Widget Function(T item)? expandedBuilder;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final SearchMatcher<T>? searchMatcher;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.expandable = false,
//     this.expandedBuilder,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//     this.onRowTap,
//     this.searchMatcher,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> expandedItems = {};
//   Set<T> selectedItems = {};
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleExpanded(T item) {
//     setState(() {
//       if (expandedItems.contains(item)) {
//         expandedItems.remove(item);
//       } else {
//         expandedItems.add(item);
//       }
//     });
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Table headers
//         Container(
//           color: Theme.of(context).dividerColor,
//           child: Row(
//             children: [
//               if (widget.selectable)
//                 const SizedBox(
//                   width: 48,
//                   child: Center(child: Text('Select')),
//                 ),
//               ...widget.headers.map((header) {
//                 return Expanded(
//                   flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       header.name,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//         // Table rows
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : ListView.builder(
//             itemCount: controller.items.length,
//             itemBuilder: (context, index) {
//               final item = controller.items[index];
//               final isExpanded = expandedItems.contains(item);
//               final isSelected = selectedItems.contains(item);
//
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       if (widget.onRowTap != null) {
//                         widget.onRowTap!(item);
//                       } else if (widget.expandable) {
//                         _toggleExpanded(item);
//                       }
//                     },
//                     child: Container(
//                       color: isExpanded ? Colors.grey[200] : null,
//                       child: Row(
//                         children: [
//                           if (widget.selectable)
//                             SizedBox(
//                               width: 48,
//                               child: Checkbox(
//                                 value: isSelected,
//                                 onChanged: (value) {
//                                   _toggleSelected(item);
//                                 },
//                               ),
//                             ),
//                           ...widget.headers.map((header) {
//                             Widget content;
//                             if (header.widgetBuilder != null) {
//                               content = header.widgetBuilder!(item);
//                             } else if (header.valueGetter != null) {
//                               final value = header.valueGetter!(item);
//                               content = Text(value);
//                             } else {
//                               content = const SizedBox();
//                             }
//                             return Expanded(
//                               flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: content,
//                               ),
//                             );
//                           }).toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (isExpanded && widget.expandedBuilder != null)
//                     widget.expandedBuilder!(item),
//                 ],
//               );
//             },
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
// }





// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // Optional parameters
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final SearchMatcher<T>? searchMatcher;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//     this.onRowTap,
//     this.searchMatcher,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
//   late ScrollController _verticalScrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//     _verticalScrollController = ScrollController();
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _verticalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Table
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : Scrollbar(
//             controller: _horizontalScrollController,
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               controller: _horizontalScrollController,
//               scrollDirection: Axis.horizontal,
//               child: Scrollbar(
//                 controller: _verticalScrollController,
//                 thumbVisibility: true,
//                 child: SingleChildScrollView(
//                   controller: _verticalScrollController,
//                   child: DataTable(
//                     columns: _buildColumns(),
//                     rows: _buildRows(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumn> _buildColumns() {
//     List<DataColumn> columns = [];
//     if (widget.selectable) {
//       columns.add(const DataColumn(label: Text('Select')));
//     }
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//     return columns;
//   }
//
//   List<DataRow> _buildRows() {
//     return widget.controller.items.asMap().entries.map((entry) {
//       final index = entry.key;
//       final item = entry.value;
//       final isSelected = selectedItems.contains(item);
//       List<DataCell> cells = [];
//
//       if (widget.selectable) {
//         cells.add(
//           DataCell(
//             Checkbox(
//               value: isSelected,
//               onChanged: (value) {
//                 _toggleSelected(item);
//               },
//             ),
//           ),
//         );
//       }
//
//       cells.addAll(widget.headers.map((header) {
//         Widget content;
//         if (header.widgetBuilder != null) {
//           content = header.widgetBuilder!(item);
//         } else if (header.valueGetter != null) {
//           final value = header.valueGetter!(item);
//           content = Text(value);
//         } else {
//           content = const SizedBox();
//         }
//         return DataCell(content);
//       }).toList());
//
//       return DataRow(
//         selected: isSelected,
//         cells: cells,
//         onSelectChanged: widget.onRowTap != null
//             ? (selected) {
//           if (selected != null && selected) {
//             widget.onRowTap!(item);
//           }
//         }
//             : null,
//       );
//     }).toList();
//   }
// }




import 'package:flutter/material.dart';

// Your existing typedefs and classes (e.g., TableHeader, SearchMatcher) remain unchanged.
//
// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // New optional parameters
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final SearchMatcher<T>? searchMatcher;
//   final bool showSelectionTitle;
//   final String selectionTitle; // Default to 'Select'
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//     this.onRowTap,
//     this.searchMatcher,
//     this.showSelectionTitle = false,
//     this.selectionTitle = 'Select',
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
//   late ScrollController _verticalScrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//     _verticalScrollController = ScrollController();
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _verticalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   void _toggleSelectAll(bool? value) {
//     setState(() {
//       if (value != null && value) {
//         selectedItems = widget.controller.items.toSet();
//       } else {
//         selectedItems.clear();
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Table
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : Scrollbar(
//             controller: _horizontalScrollController,
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               controller: _horizontalScrollController,
//               scrollDirection: Axis.horizontal,
//               child: Scrollbar(
//                 controller: _verticalScrollController,
//                 thumbVisibility: true,
//                 child: SingleChildScrollView(
//                   controller: _verticalScrollController,
//                   child: DataTable(
//                     columns: _buildColumns(),
//                     rows: _buildRows(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumn> _buildColumns() {
//     List<DataColumn> columns = [];
//     if (widget.selectable) {
//       columns.add(
//         DataColumn(
//           label: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length && widget.controller.items.isNotEmpty,
//                 onChanged: _toggleSelectAll,
//               ),
//               if (widget.showSelectionTitle)
//                 const SizedBox(width: 4),
//               if (widget.showSelectionTitle)
//                 Text(widget.selectionTitle),
//             ],
//           ),
//         ),
//       );
//     }
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//     return columns;
//   }
//
//   List<DataRow> _buildRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<DataCell> cells = [];
//
//       if (widget.selectable) {
//         cells.add(
//           DataCell(
//             Checkbox(
//               value: isSelected,
//               onChanged: (value) {
//                 _toggleSelected(item);
//               },
//             ),
//           ),
//         );
//       }
//
//       cells.addAll(widget.headers.map((header) {
//         Widget content;
//         if (header.widgetBuilder != null) {
//           content = header.widgetBuilder!(item);
//         } else if (header.valueGetter != null) {
//           final value = header.valueGetter!(item);
//           content = Text(value);
//         } else {
//           content = const SizedBox();
//         }
//         return DataCell(content);
//       }).toList());
//
//       return DataRow(
//         cells: cells,
//         onSelectChanged: widget.onRowTap != null
//             ? (selected) {
//           if (selected != null && selected) {
//             widget.onRowTap!(item);
//           }
//         }
//             : null,
//       );
//     }).toList();
//   }
// }





// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // New optional parameters
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final SearchMatcher<T>? searchMatcher;
//   final bool showSelectionTitle;
//   final String selectionTitle; // Default to 'Select'
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//     this.onRowTap,
//     this.searchMatcher,
//     this.showSelectionTitle = false,
//     this.selectionTitle = 'Select',
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
//   late ScrollController _verticalScrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//     _verticalScrollController = ScrollController();
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _verticalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   void _toggleSelectAll(bool? value) {
//     setState(() {
//       if (value != null && value) {
//         selectedItems = widget.controller.items.toSet();
//       } else {
//         selectedItems.clear();
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         if (widget.selectable)
//         // Custom Header with Select All Checkbox
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: selectedItems.length == widget.controller.items.length &&
//                       widget.controller.items.isNotEmpty,
//                   onChanged: _toggleSelectAll,
//                 ),
//                 if (widget.showSelectionTitle) ...[
//                   const SizedBox(width: 4),
//                   Text(widget.selectionTitle),
//                 ],
//               ],
//             ),
//           ),
//         // Data Table
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : Scrollbar(
//             controller: _horizontalScrollController,
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               controller: _horizontalScrollController,
//               scrollDirection: Axis.horizontal,
//               child: Scrollbar(
//                 controller: _verticalScrollController,
//                 thumbVisibility: true,
//                 child: SingleChildScrollView(
//                   controller: _verticalScrollController,
//                   child: DataTable(
//                     columns: _buildColumns(),
//                     rows: _buildRows(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumn> _buildColumns() {
//     List<DataColumn> columns = [];
//
//     // Add a single column for row selection if selectable is enabled
//     if (widget.selectable) {
//       columns.add(
//         DataColumn(
//           label: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty,
//                 onChanged: _toggleSelectAll,
//               ),
//               if (widget.showSelectionTitle) ...[
//                 const SizedBox(width: 4),
//                 Text(widget.selectionTitle),
//               ],
//             ],
//           ),
//         ),
//       );
//     }
//
//     // Add the other headers normally
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//
//     return columns;
//   }
//
//   List<DataRow> _buildRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<DataCell> cells = [];
//
//       // Add row-level selection checkbox if selectable is enabled
//       if (widget.selectable) {
//         cells.add(
//           DataCell(
//             Checkbox(
//               value: isSelected,
//               onChanged: (value) {
//                 _toggleSelected(item);
//               },
//             ),
//           ),
//         );
//       }
//
//       // Add the other row cells
//       cells.addAll(widget.headers.map((header) {
//         Widget content;
//         if (header.widgetBuilder != null) {
//           content = header.widgetBuilder!(item);
//         } else if (header.valueGetter != null) {
//           final value = header.valueGetter!(item);
//           content = Text(value);
//         } else {
//           content = const SizedBox();
//         }
//         return DataCell(content);
//       }).toList());
//
//       return DataRow(
//         cells: cells,
//         onSelectChanged: widget.onRowTap != null
//             ? (selected) {
//           if (selected != null && selected) {
//             widget.onRowTap!(item);
//           }
//         }
//             : null,
//       );
//     }).toList();
//   }
//
//
//
//
//
//
//
// }


// selection issue fixed
// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // New optional parameters
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final SearchMatcher<T>? searchMatcher;
//   final bool showSelectionTitle;
//   final String selectionTitle; // Default to 'Select'
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//     this.onRowTap,
//     this.searchMatcher,
//     this.showSelectionTitle = false,
//     this.selectionTitle = 'Select',
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
//   late ScrollController _verticalScrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//     _verticalScrollController = ScrollController();
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _verticalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   void _toggleSelectAll(bool? value) {
//     setState(() {
//       if (value != null && value) {
//         selectedItems = widget.controller.items.toSet();
//       } else {
//         selectedItems.clear();
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = widget.controller;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Data Table
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : Scrollbar(
//             controller: _horizontalScrollController,
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               controller: _horizontalScrollController,
//               scrollDirection: Axis.horizontal,
//               child: Scrollbar(
//                 controller: _verticalScrollController,
//                 thumbVisibility: true,
//                 child: SingleChildScrollView(
//                   controller: _verticalScrollController,
//                   child: DataTable(
//                     columns: _buildColumns(),
//                     rows: _buildRows(),
//                     showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumn> _buildColumns() {
//     List<DataColumn> columns = [];
//
//     // Add a single column for row selection if selectable is enabled
//     if (widget.selectable) {
//       columns.add(
//         DataColumn(
//           label: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty,
//                 onChanged: _toggleSelectAll,
//               ),
//               if (widget.showSelectionTitle) ...[
//                 const SizedBox(width: 4),
//                 Text(widget.selectionTitle),
//               ],
//             ],
//           ),
//         ),
//       );
//     }
//
//     // Add the other headers normally
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//
//     return columns;
//   }
//
//   List<DataRow> _buildRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<DataCell> cells = [];
//
//       // Add row-level selection checkbox if selectable is enabled
//       if (widget.selectable) {
//         cells.add(
//           DataCell(
//             Checkbox(
//               value: isSelected,
//               onChanged: (value) {
//                 _toggleSelected(item);
//               },
//             ),
//           ),
//         );
//       }
//
//       // Add the other row cells
//       cells.addAll(widget.headers.map((header) {
//         Widget content;
//         if (header.widgetBuilder != null) {
//           content = header.widgetBuilder!(item);
//         } else if (header.valueGetter != null) {
//           final value = header.valueGetter!(item);
//           content = Text(value);
//         } else {
//           content = const SizedBox();
//         }
//         return DataCell(content);
//       }).toList());
//
//       return DataRow(
//         selected: isSelected,
//         cells: cells,
//         onSelectChanged: widget.onRowTap != null
//             ? (selected) {
//           if (selected != null && selected) {
//             widget.onRowTap!(item);
//           }
//         }
//             : null,
//       );
//     }).toList();
//   }
// }




class DataTableWidget<T> extends StatefulWidget {
  final List<TableHeader<T>> headers;
  final DataTableController<T> controller;
  final bool showSearch;
  final bool showPagination;

  // New optional parameters
  final bool selectable;
  final List<T>? selectedItems;
  final Function(List<T> selectedItems)? onSelectionChanged;
  final Function(T item)? onRowTap;
  final SearchMatcher<T>? searchMatcher;
  final bool showSelectionTitle;
  final String selectionTitle; // Default to 'Select'

  const DataTableWidget({
    Key? key,
    required this.headers,
    required this.controller,
    this.showSearch = true,
    this.showPagination = true,
    this.selectable = false,
    this.selectedItems,
    this.onSelectionChanged,
    this.onRowTap,
    this.searchMatcher,
    this.showSelectionTitle = false,
    this.selectionTitle = 'Select',
  }) : super(key: key);

  @override
  _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
}

class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
  Set<T> selectedItems = {};
  late ScrollController _horizontalScrollController;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItems != null) {
      selectedItems = widget.selectedItems!.toSet();
    }
    widget.controller.addListener(_onControllerChanged);
    widget.controller.refresh(); // Initial data fetch
    _horizontalScrollController = ScrollController();
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _toggleSelected(T item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(selectedItems.toList());
      }
    });
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      if (value != null && value) {
        selectedItems = widget.controller.items.toSet();
      } else {
        selectedItems.clear();
      }
      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(selectedItems.toList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (widget.showSearch)
            // Search bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    controller.setSearchQuery(value);
                  },
                ),
              ),
            // Data Table
            Expanded(
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : controller.items.isEmpty
                  ? const Center(child: Text('No items found.'))
                  : ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: _buildColumns(),
                        rows: _buildRows(),
                        showCheckboxColumn: false, // Disable DataTable's default checkboxes
                        columnSpacing: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.showPagination)
            // Pagination controls
              PaginationWidget<T>(controller: controller),
          ],
        );
      },
    );
  }

  List<DataColumn> _buildColumns() {
    List<DataColumn> columns = [];

    // Add a single column for row selection if selectable is enabled
    if (widget.selectable) {
      columns.add(
        DataColumn(
          label: Row(
            children: [
              Checkbox(
                value: selectedItems.length == widget.controller.items.length &&
                    widget.controller.items.isNotEmpty,
                onChanged: _toggleSelectAll,
              ),
              if (widget.showSelectionTitle) ...[
                const SizedBox(width: 4),
                Text(widget.selectionTitle),
              ],
            ],
          ),
        ),
      );
    }

    // Add the other headers normally
    columns.addAll(widget.headers.map((header) {
      return DataColumn(
        label: Text(
          header.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }).toList());

    return columns;
  }

  List<DataRow> _buildRows() {
    return widget.controller.items.map((item) {
      final isSelected = selectedItems.contains(item);
      List<DataCell> cells = [];

      // Add row-level selection checkbox if selectable is enabled
      if (widget.selectable) {
        cells.add(
          DataCell(
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                _toggleSelected(item);
              },
            ),
          ),
        );
      }

      // Add the other row cells
      cells.addAll(widget.headers.map((header) {
        Widget content;
        if (header.widgetBuilder != null) {
          content = header.widgetBuilder!(item);
        } else if (header.valueGetter != null) {
          final value = header.valueGetter!(item);
          content = Text(value);
        } else {
          content = const SizedBox();
        }
        return DataCell(content);
      }).toList());

      return DataRow(
        selected: isSelected,
        cells: cells,
        onSelectChanged: widget.onRowTap != null
            ? (selected) {
          if (selected != null && selected) {
            widget.onRowTap!(item);
          }
        }
            : null,
      );
    }).toList();
  }
}


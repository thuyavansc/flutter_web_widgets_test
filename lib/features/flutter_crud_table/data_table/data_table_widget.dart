import 'package:data_table_2/data_table_2.dart';

// lib/data_table/data_table_widget.dart
import 'package:flutter/material.dart';
import '../../others/data_table_t1.dart';
import '../components/table_header.dart';
import 'data_table_controller.dart';
import 'pagination_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:pluto_grid/pluto_grid.dart';



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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : SingleChildScrollView(
//                 controller: _horizontalScrollController,
//                 scrollDirection: Axis.horizontal,
//                 child: Container(
//                   width: constraints.maxWidth, // Make sure DataTable takes full width
//                   child: DataTable(
//                     columns: _buildColumns(),
//                     rows: _buildRows(),
//                     showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
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






// //Working Datatable code
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: DataTable(
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey, // Color of the vertical line
//                             width: 1, // Thickness of the vertical line
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey, // Horizontal lines (optional, for rows)
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         columns: _buildColumns(),
//                         rows: _buildRows(),
//                         showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                         columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
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





// colum width resize working - Datatable2
// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final bool showSelectionTitle;
//   final String selectionTitle;
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
//   List<DataColumn2> _buildColumns() {
//     List<DataColumn2> columns = [];
//
//     if (widget.selectable) {
//       columns.add(
//         DataColumn2(
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
//           fixedWidth: 150, // Fixed width for selection column
//         ),
//       );
//     }
//
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn2(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         size: ColumnSize.S, // Adjust other columns if necessary
//       );
//     }).toList());
//
//     return columns;
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
//     return Column(
//       children: [
//         if (widget.showSearch)
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
//         Expanded(
//           child: ClipRect( // Optional, if you want to clip overflowed content
//             child: DataTable2(
//               columns: _buildColumns(),
//               rows: _buildRows(),
//               columnSpacing: 20, // Reduce if necessary
//               minWidth: 400, // Set based on your screen width
//               showCheckboxColumn: false,
//             ),
//           ),
//         )
//
//       ],
//     );
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
//         final value = header.valueGetter?.call(item) ?? '';
//         return DataCell(Text(value));
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
// }



//Fixed Column Size working with DataTable2 not default Flutter Datatable
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
//               : Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: DataTable2(
//                             border: TableBorder(
//                 verticalInside: BorderSide(
//                   color: Colors.grey, // Color of the vertical line
//                   width: 1, // Thickness of the vertical line
//                 ),
//                 horizontalInside: BorderSide(
//                   color: Colors.grey, // Horizontal lines (optional, for rows)
//                   width: 1,
//                 ),
//                 top: BorderSide(
//                   color: Colors.grey,
//                   width: 1,
//                 ),
//                 bottom: BorderSide(
//                   color: Colors.grey,
//                   width: 1,
//                 ),
//                 left: BorderSide(
//                   color: Colors.grey,
//                   width: 1,
//                 ),
//                 right: BorderSide(
//                   color: Colors.grey,
//                   width: 1,
//                 ),
//                             ),
//                             columns: _buildColumns(),
//                             rows: _buildRows(),
//                             showCheckboxColumn: false, // Disable default checkbox column
//                             columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                             minWidth: 500, // Set a minimum width for the entire table
//                           ),
//               ),
//         ),
//         if (widget.showPagination)
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumn2> _buildColumns() {
//     List<DataColumn2> columns = [];
//
//     // Add a single column for row selection if selectable is enabled
//     if (widget.selectable) {
//       columns.add(
//         DataColumn2(
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
//           fixedWidth: widget.showSelectionTitle ? 110 : 40, // Fixed width for selection column
//         ),
//       );
//     }
//
//     // Add other headers normally
//     columns.addAll(widget.headers.map((header) {
//       return DataColumn2(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         size: ColumnSize.S, // Adjust as needed
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
//       // Add other row cells normally
//       cells.addAll(widget.headers.map((header) {
//         final value = header.valueGetter?.call(item) ?? '';
//         return DataCell(Text(value));
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





// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//
//   // New optional parameters
//   final bool selectable;
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
//     this.selectable = false, // Default to false
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
//
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _onSelectAll(bool? value) {
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
//   void _onRowSelectChanged(bool? selected, T item) {
//     setState(() {
//       if (selected == true) {
//         selectedItems.add(item);
//       } else {
//         selectedItems.remove(item);
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: DataTable(
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey, // Color of the vertical line
//                             width: 1, // Thickness of the vertical line
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey, // Horizontal lines (optional, for rows)
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         columns: _buildColumns(),
//                         rows: _buildRows(),
//                         showCheckboxColumn: widget.selectable, // Show checkbox column only if selectable is true
//                         columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   List<DataColumn> _buildColumns() {
//     // Add the headers normally (we no longer add a custom selection header)
//     return widget.headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList();
//   }
//
//   List<DataRow> _buildRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<DataCell> cells = widget.headers.map((header) {
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
//       }).toList();
//
//       return DataRow(
//         selected: isSelected,
//         cells: cells,
//         onSelectChanged: widget.selectable
//             ? (selected) {
//           _onRowSelectChanged(selected, item);
//         }
//             : null,
//       );
//     }).toList();
//   }
// }




//selection size decrease and wrap text comes next line
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
//   final double fixedSelectionColumnWidth; // Width for the selection column
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
//     this.fixedSelectionColumnWidth = 60.0, // Default fixed width for selection column
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Table(
//                         columnWidths: _buildColumnWidths(),
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         children: [
//                           _buildHeaderRow(),
//                           ..._buildDataRows(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   Map<int, TableColumnWidth> _buildColumnWidths() {
//     Map<int, TableColumnWidth> columnWidths = {};
//
//     if (widget.selectable) {
//       columnWidths[0] = FixedColumnWidth(widget.fixedSelectionColumnWidth);
//     }
//
//     for (int i = 0; i < widget.headers.length; i++) {
//       columnWidths[widget.selectable ? i + 1 : i] = const FlexColumnWidth();
//     }
//
//     return columnWidths;
//   }
//
//   TableRow _buildHeaderRow() {
//     List<Widget> cells = [];
//
//     if (widget.selectable) {
//       cells.add(
//         Container(
//           width: widget.fixedSelectionColumnWidth,
//           alignment: Alignment.center,
//           child: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty,
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
//
//     cells.addAll(widget.headers.map((header) {
//       return Container(
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//
//     return TableRow(children: cells);
//   }
//
//   List<TableRow> _buildDataRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<Widget> cells = [];
//
//       if (widget.selectable) {
//         cells.add(
//           Container(
//             width: widget.fixedSelectionColumnWidth,
//             alignment: Alignment.center,
//             child: Checkbox(
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
//         return Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: content,
//         );
//       }).toList());
//
//       return TableRow(children: cells);
//     }).toList();
//   }
// }



//Selection Size decrease and showing dot dot line

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
//   final double fixedSelectionColumnWidth; // Width for the selection column
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
//     this.fixedSelectionColumnWidth = 60.0, // Default fixed width for selection column
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Table(
//                         columnWidths: _buildColumnWidths(),
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         children: [
//                           _buildHeaderRow(),
//                           ..._buildDataRows(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   Map<int, TableColumnWidth> _buildColumnWidths() {
//     Map<int, TableColumnWidth> columnWidths = {};
//
//     if (widget.selectable) {
//       columnWidths[0] = FixedColumnWidth(widget.fixedSelectionColumnWidth);
//     }
//
//     for (int i = 0; i < widget.headers.length; i++) {
//       columnWidths[widget.selectable ? i + 1 : i] = const FlexColumnWidth();
//     }
//
//     return columnWidths;
//   }
//
//   TableRow _buildHeaderRow() {
//     List<Widget> cells = [];
//
//     if (widget.selectable) {
//       cells.add(
//         Container(
//           width: widget.fixedSelectionColumnWidth,
//           alignment: Alignment.center,
//           child: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty,
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
//
//     cells.addAll(widget.headers.map((header) {
//       return Container(
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//
//     return TableRow(children: cells);
//   }
//
//   List<TableRow> _buildDataRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<Widget> cells = [];
//
//       if (widget.selectable) {
//         cells.add(
//           Container(
//             width: widget.fixedSelectionColumnWidth,
//             alignment: Alignment.center,
//             child: Checkbox(
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
//           content = Text(
//             value,
//             overflow: TextOverflow.ellipsis, // Ensure long text remains within bounds if screen space is tight
//           );
//         } else {
//           content = const SizedBox();
//         }
//         return Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: content,
//         );
//       }).toList());
//
//       return TableRow(children: cells);
//     }).toList();
//   }
// }





// //Working Datatable code
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: DataTable(
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey, // Color of the vertical line
//                             width: 1, // Thickness of the vertical line
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey, // Horizontal lines (optional, for rows)
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         columns: _buildColumns(),
//                         rows: _buildRows(),
//                         showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                         columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
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
//   final double selectionColumnWidth; // New parameter for selection column width
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
//     this.selectionColumnWidth = 50.0, // Default width for the selection column
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Table(
//                         columnWidths: _buildColumnWidths(),
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         children: [
//                           _buildHeaderRow(),
//                           ..._buildDataRows(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   Map<int, TableColumnWidth> _buildColumnWidths() {
//     Map<int, TableColumnWidth> columnWidths = {};
//
//     // Assign a fixed width to the selection column if selectable is enabled
//     if (widget.selectable) {
//       columnWidths[0] = FixedColumnWidth(widget.selectionColumnWidth);
//     }
//
//     // Set the width for the remaining columns as flexibly spaced
//     for (int i = 0; i < widget.headers.length; i++) {
//       columnWidths[widget.selectable ? i + 1 : i] = const FlexColumnWidth();
//     }
//
//     return columnWidths;
//   }
//
//   TableRow _buildHeaderRow() {
//     List<Widget> cells = [];
//
//     if (widget.selectable) {
//       cells.add(
//         Container(
//           width: widget.selectionColumnWidth,
//           alignment: Alignment.center,
//           child: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty,
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
//
//     cells.addAll(widget.headers.map((header) {
//       return Container(
//         alignment: Alignment.centerLeft,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       );
//     }).toList());
//
//     return TableRow(children: cells);
//   }
//
//   List<TableRow> _buildDataRows() {
//     return widget.controller.items.map((item) {
//       final isSelected = selectedItems.contains(item);
//       List<Widget> cells = [];
//
//       if (widget.selectable) {
//         cells.add(
//           Container(
//             width: widget.selectionColumnWidth,
//             alignment: Alignment.center,
//             child: Checkbox(
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
//         return Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: content,
//         );
//       }).toList());
//
//       return TableRow(children: cells);
//     }).toList();
//   }
// }



//firstModification
// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final bool showSelectionTitle;
//   final String selectionTitle;
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
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh();
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
//               : SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTableT1(
//               columns: _buildColumns(),
//               rows: _buildRows(),
//               showCheckboxColumn: widget.selectable,
//               columnSpacing: 40,
//               sortColumnIndex: 0, // Adjust based on sorting requirements
//               sortAscending: true,
//               border: TableBorder.all(color: Colors.grey, width: 1),
//             ),
//           ),
//         ),
//         if (widget.showPagination) PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumnT1> _buildColumns() {
//     List<DataColumnT1> columns = [];
//
//     if (widget.selectable) {
//       columns.add(
//         DataColumnT1(
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
//           fixedWidth: 120, // Fixed width for the selection column
//         ),
//       );
//     }
//
//     columns.addAll(widget.headers.map((header) {
//       return DataColumnT1(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         //fixedWidth: header.fixedWidth, // Optional: Add fixed width for other columns if needed
//       );
//     }).toList());
//
//     return columns;
//   }
//
//   List<DataRowT1> _buildRows() {
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
//       return DataRowT1(
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




//Custom widget- not worked as expected
// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//   final Function(T item)? onRowTap;
//   final bool showSelectionTitle;
//   final String selectionTitle;
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
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh();
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
//               : SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minWidth: MediaQuery.of(context).size.width,
//               ),
//               child: DataTableT1(
//                 columns: _buildColumns(),
//                 rows: _buildRows(),
//                 showCheckboxColumn: false, // Disable default selection column
//                 columnSpacing: 40,
//                 sortColumnIndex: 0,
//                 sortAscending: true,
//                 border: TableBorder.all(color: Colors.grey, width: 1),
//               ),
//             ),
//           ),
//         ),
//         if (widget.showPagination) PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<DataColumnT1> _buildColumns() {
//     List<DataColumnT1> columns = [];
//
//     if (widget.selectable) {
//       columns.add(
//         DataColumnT1(
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
//           fixedWidth: 120, // Fixed width for the selection column
//         ),
//       );
//     }
//
//     columns.addAll(widget.headers.map((header) {
//       return DataColumnT1(
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
//   List<DataRowT1> _buildRows() {
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
//       return DataRowT1(
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











//Working Datatable code
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
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Table
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : ScrollConfiguration(
//                 behavior: ScrollBehavior().copyWith(overscroll: false),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(minWidth: constraints.maxWidth),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: DataTable(
//                         border: TableBorder(
//                           verticalInside: BorderSide(
//                             color: Colors.grey, // Color of the vertical line
//                             width: 1, // Thickness of the vertical line
//                           ),
//                           horizontalInside: BorderSide(
//                             color: Colors.grey, // Horizontal lines (optional, for rows)
//                             width: 1,
//                           ),
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           left: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                           right: BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         columns: _buildColumns(),
//                         rows: _buildRows(),
//                         showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                         columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
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




//Working code
// Assuming TableHeader, DataTableController, DataPage, and PaginationWidget are defined as in your original code.

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
//   late _SyncfusionDataGridSource<T> _dataGridSource;
//   bool _isAllSelected = false;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedItems = widget.selectedItems?.toSet() ?? {};
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _horizontalScrollController = ScrollController();
//     _dataGridSource = _SyncfusionDataGridSource<T>(
//       items: widget.controller.items,
//       headers: widget.headers,
//       selectedItems: selectedItems,
//       onSelectedChanged: _onSelectedChanged,
//       onRowTap: widget.onRowTap,
//     );
//   }
//
//   void _onControllerChanged() {
//     setState(() {
//       _dataGridSource.updateData(widget.controller.items);
//       // Update selection state if necessary
//       _isAllSelected = selectedItems.length == widget.controller.items.length;
//       _dataGridSource.notifyListeners();
//     });
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _onSelectedChanged(T item, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         selectedItems.add(item);
//       } else {
//         selectedItems.remove(item);
//       }
//
//       _isAllSelected = selectedItems.length == widget.controller.items.length;
//
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
//         _isAllSelected = true;
//       } else {
//         selectedItems.clear();
//         _isAllSelected = false;
//       }
//       _dataGridSource.selectAll(_isAllSelected);
//
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Grid
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : SfDataGrid(
//                 source: _dataGridSource,
//                 allowSorting: true,
//                 allowFiltering: true,
//                 allowMultiColumnSorting: true,
//                 //selectionMode: widget.selectable ? SelectionMode.multiple : SelectionMode.none,
//                 isScrollbarAlwaysShown: true,
//                 showHorizontalScrollbar: true,
//                 selectionMode: SelectionMode.none,
//                 headerGridLinesVisibility: GridLinesVisibility.both,
//                 gridLinesVisibility: GridLinesVisibility.both,
//                 allowPullToRefresh: false,
//                 footer: Container(
//                     //color: Colors.grey[400],
//                     child: Center(
//                         child: PaginationWidget<T>(controller: controller)
//                     )
//                 ),
//                 navigationMode: GridNavigationMode.row,
//                 columnWidthMode: ColumnWidthMode.fill,
//                 //columnWidthMode: ColumnWidthMode.fitByCellValue,
//                 onSelectionChanged: widget.selectable
//                     ? (addedRows, removedRows) {
//                   // Handle selection changes if needed
//                   // Syncfusion handles selection via DataGridSource
//                 }
//                     : null,
//                 onCellTap: widget.onRowTap != null
//                     ? (DataGridCellTapDetails details) {
//                   if (details.rowColumnIndex.rowIndex > 0) {
//                     final dataRow = _dataGridSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
//                     final T item = _dataGridSource.getItemAt(details.rowColumnIndex.rowIndex - 1);
//                     widget.onRowTap!(item);
//                   }
//                 }
//                     : null,
//                 columns: _buildColumns(),
//               ),
//             ),
//             SizedBox(height: 12,),
//             // if (widget.showPagination)
//             // // Pagination controls
//             //   PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   List<GridColumn> _buildColumns() {
//     List<GridColumn> columns = [];
//
//     // Add a fixed selection column if selectable is enabled
//     if (widget.selectable) {
//       columns.add(GridColumn(
//         columnName: 'select',
//         width: 150,
//         allowSorting: false,
//         label: Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.center,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Checkbox(
//                 value: _isAllSelected,
//                 onChanged: _toggleSelectAll,
//               ),
//               if (widget.showSelectionTitle)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 4.0),
//                   child: Text(widget.selectionTitle),
//                 ),
//             ],
//           ),
//         ),
//       ));
//     }
//
//     // Add other columns based on headers
//     for (var header in widget.headers) {
//       columns.add(GridColumn(
//         columnName: header.name,
//         //width: header.width ?? 150, // Use header width if provided
//         label: Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             header.name,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ));
//     }
//
//     return columns;
//   }
// }
//
// class _SyncfusionDataGridSource<T> extends DataGridSource {
//   List<T> _data = [];
//   final List<TableHeader<T>> headers;
//   final Set<T> selectedItems;
//   final Function(T item, bool isSelected) onSelectedChanged;
//   final Function(T item)? onRowTap;
//
//   _SyncfusionDataGridSource({
//     required List<T> items,
//     required this.headers,
//     required this.selectedItems,
//     required this.onSelectedChanged,
//     this.onRowTap,
//   }) {
//     _data = items;
//     buildDataGridRows();
//   }
//
//   List<DataGridRow> _dataGridRows = [];
//
//   void buildDataGridRows() {
//     _dataGridRows = _data.map<DataGridRow>((item) {
//       List<DataGridCell> cells = [];
//
//       // If selection is enabled, add a checkbox cell
//       cells.add(DataGridCell<bool>(
//         columnName: 'select',
//         value: selectedItems.contains(item),
//       ));
//
//       for (var header in headers) {
//         dynamic cellValue;
//         if (header.valueGetter != null) {
//           cellValue = header.valueGetter!(item);
//         } else if (header.widgetBuilder != null) {
//           // For widgets, you might need to handle differently or convert to String
//           // For simplicity, we'll use a placeholder text
//           cellValue = 'Widget';
//         } else {
//           cellValue = '';
//         }
//         cells.add(DataGridCell<dynamic>(
//           columnName: header.name,
//           value: cellValue,
//         ));
//       }
//
//       return DataGridRow(cells: cells);
//     }).toList();
//   }
//
//   void updateData(List<T> items) {
//     _data = items;
//     buildDataGridRows();
//     notifyListeners();
//   }
//
//   @override
//   List<DataGridRow> get rows => _dataGridRows;
//
//   T getItemAt(int index) {
//     return _data[index];
//   }
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     // Retrieve the item corresponding to this row
//     int rowIndex = _dataGridRows.indexOf(row);
//     T item = _data[rowIndex];
//
//     List<Widget> cells = [];
//
//     for (var cell in row.getCells()) {
//       if (cell.columnName == 'select') {
//         bool isSelected = selectedItems.contains(item);
//         cells.add(
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             alignment: Alignment.center,
//             child: Checkbox(
//               value: isSelected,
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   onSelectedChanged(item, value);
//                 }
//               },
//             ),
//           ),
//         );
//       } else {
//         Widget content;
//         // Find the corresponding header
//         final header = headers.firstWhere((h) => h.name == cell.columnName, orElse: () => TableHeader<T>(name: cell.columnName));
//         if (header.widgetBuilder != null) {
//           content = header.widgetBuilder!(item);
//         } else {
//           content = Text(
//             cell.value.toString(),
//             overflow: TextOverflow.ellipsis,
//           );
//         }
//
//         cells.add(
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             alignment: Alignment.centerLeft,
//             child: content,
//           ),
//         );
//       }
//     }
//
//     return DataGridRowAdapter(
//       cells: cells,
//       // Removed onTap as it's not a valid parameter
//     );
//   }
//
//   // Implement selection logic
//   @override
//   bool? get isRowCountApproximate => false;
//
//   @override
//   int get rowCount => _data.length;
//
//   @override
//   int get selectedRowCount => selectedItems.length;
//
//   // Implement selectAll method
//   void selectAll(bool select) {
//     if (select) {
//       for (var item in _data) {
//         selectedItems.add(item);
//       }
//     } else {
//       selectedItems.clear();
//     }
//     notifyListeners();
//   }
// }




// Assuming TableHeader, DataTableController, DataPage, and PaginationWidget are defined as in your original code.

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
//   late _SyncfusionDataGridSource<T> _dataGridSource;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedItems = widget.selectedItems?.toSet() ?? {};
//     widget.controller.addListener(_onControllerChanged);
//     widget.controller.refresh(); // Initial data fetch
//     _dataGridSource = _SyncfusionDataGridSource<T>(
//       items: widget.controller.items,
//       headers: widget.headers,
//       onSelectedChanged: _onSelectedChanged,
//       onRowTap: widget.onRowTap,
//     );
//   }
//
//   void _onControllerChanged() {
//     setState(() {
//       _dataGridSource.updateData(widget.controller.items);
//     });
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _onSelectedChanged(T item, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         selectedItems.add(item);
//       } else {
//         selectedItems.remove(item);
//       }
//
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
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             if (widget.showSearch)
//             // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: 'Search...',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                   onChanged: (value) {
//                     controller.setSearchQuery(value);
//                   },
//                 ),
//               ),
//             // Data Grid
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : controller.items.isEmpty
//                   ? const Center(child: Text('No items found.'))
//                   : SfDataGrid(
//                 source: _dataGridSource,
//                 allowSorting: true,
//                 allowFiltering: true,
//                 showCheckboxColumn: true,
//                 checkboxColumnSettings: DataGridCheckboxColumnSettings(
//                     label: Text('Selector'), width: 100),
//                 checkboxShape: CircleBorder(),
//                 allowMultiColumnSorting: true,
//                 //selectionMode: widget.selectable ? SelectionMode.multiple : SelectionMode.none,
//                 selectionMode: SelectionMode.none,
//                 headerGridLinesVisibility: GridLinesVisibility.both,
//                 gridLinesVisibility: GridLinesVisibility.both,
//                 allowPullToRefresh: false,
//                 navigationMode: GridNavigationMode.row,
//                 columnWidthMode: ColumnWidthMode.fill,
//                 onSelectionChanged: widget.selectable
//                     ? (addedRows, removedRows) {
//                   // Handle selection changes using built-in mechanisms
//                   List<T> selected = addedRows
//                       .map((DataGridRow row) =>
//                       _dataGridSource.getItemAt(_dataGridSource.effectiveRows.indexOf(row)))
//                       .toList();
//
//                   List<T> deselected = removedRows
//                       .map((DataGridRow row) =>
//                       _dataGridSource.getItemAt(_dataGridSource.effectiveRows.indexOf(row)))
//                       .toList();
//
//                   setState(() {
//                     selectedItems.addAll(selected);
//                     selectedItems.removeAll(deselected);
//                   });
//
//                   if (widget.onSelectionChanged != null) {
//                     widget.onSelectionChanged!(selectedItems.toList());
//                   }
//                 }
//                     : null,
//                 onCellTap: widget.onRowTap != null
//                     ? (DataGridCellTapDetails details) {
//                   if (details.rowColumnIndex.rowIndex > 0) {
//                     final dataRow = _dataGridSource.effectiveRows[details.rowColumnIndex.rowIndex - 1];
//                     final T item = _dataGridSource.getItemAt(details.rowColumnIndex.rowIndex - 1);
//                     widget.onRowTap!(item);
//                   }
//                 }
//                     : null,
//                 columns: _buildColumns(),
//               ),
//             ),
//             if (widget.showPagination)
//             // Pagination controls
//               PaginationWidget<T>(controller: controller),
//           ],
//         );
//       },
//     );
//   }
//
//   List<GridColumn> _buildColumns() {
//     List<GridColumn> columns = [];
//
//     // No custom selection column added here
//
//     // Add other columns based on headers
//     for (var header in widget.headers) {
//       columns.add(GridColumn(
//         columnName: header.name,
//         minimumWidth: header.width ?? 100, // Set a minimum width
//         label: Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             header.name,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ));
//     }
//
//     return columns;
//   }
// }
//
//
//
// class _SyncfusionDataGridSource<T> extends DataGridSource {
//   List<T> _data = [];
//   final List<TableHeader<T>> headers;
//   final Function(T item, bool isSelected) onSelectedChanged;
//   final Function(T item)? onRowTap;
//
//   _SyncfusionDataGridSource({
//     required List<T> items,
//     required this.headers,
//     required this.onSelectedChanged,
//     this.onRowTap,
//   }) {
//     _data = items;
//     buildDataGridRows();
//   }
//
//   List<DataGridRow> _dataGridRows = [];
//
//   void buildDataGridRows() {
//     _dataGridRows = _data.map<DataGridRow>((item) {
//       List<DataGridCell> cells = [];
//
//       for (var header in headers) {
//         dynamic cellValue;
//         if (header.valueGetter != null) {
//           cellValue = header.valueGetter!(item);
//         } else if (header.widgetBuilder != null) {
//           // If using custom widgets, consider handling them appropriately
//           cellValue = 'Widget'; // Placeholder or handle as needed
//         } else {
//           cellValue = '';
//         }
//         cells.add(DataGridCell<dynamic>(
//           columnName: header.name,
//           value: cellValue,
//         ));
//       }
//
//       return DataGridRow(cells: cells);
//     }).toList();
//   }
//
//   void updateData(List<T> items) {
//     _data = items;
//     buildDataGridRows();
//     notifyListeners();
//   }
//
//   @override
//   List<DataGridRow> get rows => _dataGridRows;
//
//   T getItemAt(int index) {
//     return _data[index];
//   }
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     // Retrieve the item corresponding to this row
//     int rowIndex = _dataGridRows.indexOf(row);
//     T item = _data[rowIndex];
//
//     List<Widget> cells = [];
//
//     for (var cell in row.getCells()) {
//       Widget content;
//       // Find the corresponding header
//       final header = headers.firstWhere(
//               (h) => h.name == cell.columnName,
//           orElse: () => TableHeader<T>(name: cell.columnName));
//       if (header.widgetBuilder != null) {
//         content = header.widgetBuilder!(item);
//       } else {
//         content = Text(
//           cell.value.toString(),
//           overflow: TextOverflow.ellipsis,
//         );
//       }
//
//       cells.add(
//         Container(
//           padding: const EdgeInsets.all(8.0),
//           alignment: Alignment.centerLeft,
//           child: content,
//         ),
//       );
//     }
//
//     return DataGridRowAdapter(
//       cells: cells,
//       // Optionally, customize row appearance here
//     );
//   }
//
//   // Implement selection logic if needed
//   @override
//   bool? get isRowCountApproximate => false;
//
//   @override
//   int get rowCount => _data.length;
//
//   @override
//   int get selectedRowCount => 0; // Managed by SfDataGrid
// }






// data_table_widget.dart



// data_table_widget.dart



// data_table_widget.dart

// data_table_widget.dart

// data_table_widget.dart
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
//   final bool showSelectionTitle;
//   final String selectionTitle;
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
//   late PlutoGridStateManager stateManager;
//
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
//     // Build columns and rows
//     final columns = _buildColumns();
//     final rows = _buildRows();
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
//
//         // PlutoGrid
//         Expanded(
//           child: controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : controller.items.isEmpty
//               ? const Center(child: Text('No items found.'))
//               : PlutoGrid(
//             columns: columns,
//             rows: rows,
//             mode: PlutoGridMode.select,
//             onLoaded: (PlutoGridOnLoadedEvent event) {
//               stateManager = event.stateManager;
//
//               // Initialize selection
//               if (widget.selectedItems != null &&
//                   widget.selectedItems!.isNotEmpty) {
//                 for (var row in stateManager.refRows) {
//                   final item =
//                   row.cells['_item_']?.value as T?;
//                   if (item != null &&
//                       widget.selectedItems!.contains(item)) {
//                     stateManager.setRowChecked(row, true);
//                   }
//                 }
//               }
//             },
//             onRowChecked: (PlutoGridOnRowCheckedEvent event) {
//               // Handle row checked changes
//               final selectedRows = stateManager.checkedRows;
//               final selectedItems = selectedRows
//                   .map((row) => row.cells['_item_']?.value as T)
//                   .toList();
//
//               if (widget.onSelectionChanged != null) {
//                 widget.onSelectionChanged!(selectedItems);
//               }
//             },
//             onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) {
//               if (widget.onRowTap != null) {
//                 final item = event.row.cells['_item_']?.value as T;
//                 widget.onRowTap!(item);
//               }
//             },
//             configuration: PlutoGridConfiguration(
//               //enableRowChecked: widget.selectable,
//             ),
//           ),
//         ),
//
//         // Pagination controls
//         if (widget.showPagination)
//           PaginationWidget<T>(controller: controller),
//       ],
//     );
//   }
//
//   List<PlutoColumn> _buildColumns() {
//     List<PlutoColumn> columns = [];
//
//     // Map headers to PlutoColumns
//     columns.addAll(widget.headers.map((header) {
//       PlutoColumn column = PlutoColumn(
//         title: header.name,
//         field: header.name, // Ensure unique field names
//         type: PlutoColumnType.text(),
//       );
//
//       // If widgetBuilder is provided, set the renderer
//       if (header.widgetBuilder != null) {
//         column.renderer = (rendererContext) {
//           final row = rendererContext.row;
//           final item = row.cells['_item_']?.value as T;
//           return header.widgetBuilder!(item);
//         };
//       }
//
//       return column;
//     }).toList());
//
//     return columns;
//   }
//
//   List<PlutoRow> _buildRows() {
//     return widget.controller.items.map((item) {
//       final cells = <String, PlutoCell>{};
//
//       // Store the item in a special cell
//       cells['_item_'] = PlutoCell(value: item);
//
//       // Build cells for each column
//       for (final header in widget.headers) {
//         dynamic cellValue;
//         if (header.valueGetter != null) {
//           cellValue = header.valueGetter!(item);
//         } else {
//           cellValue = '';
//         }
//         cells[header.name] = PlutoCell(value: cellValue);
//       }
//
//       return PlutoRow(
//         cells: cells,
//         checked: true,
//       );
//     }).toList();
//   }
// }







class DataTableWidget<T> extends StatefulWidget {
  final List<TableHeader<T>> headers;
  final DataTableController<T> controller;
  final bool showSearch;
  final bool showPagination;
  final bool selectable;
  final List<T>? selectedItems;
  final Function(List<T> selectedItems)? onSelectionChanged;
  final Function(T item)? onRowTap;
  final SearchMatcher<T>? searchMatcher;
  final bool showSelectionTitle;
  final String selectionTitle;

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
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItems != null) {
      selectedItems = widget.selectedItems!.toSet();
    }
    widget.controller.addListener(_onControllerChanged);
    widget.controller.refresh(); // Initial data fetch
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    final columns = _buildColumns();
    final rows = _buildRows();

    return Column(
      children: [
        if (widget.showSearch)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                widget.controller.setSearchQuery(value);
              },
            ),
          ),
        Expanded(
          child: widget.controller.isLoading
              ? const Center(child: CircularProgressIndicator()) // Show loading indicator when data is loading
              : PlutoGrid(
            columns: columns,
            rows: rows,
            onLoaded: (event) {
              stateManager = event.stateManager;
              if (widget.selectable) {
                stateManager.setSelectingMode(PlutoGridSelectingMode.row);
              }
            },
            onChanged: (event) {
              print(event);
            },
            configuration: const PlutoGridConfiguration(),
          ),
        ),
        if (widget.showPagination)
          PaginationWidget<T>(controller: widget.controller),
      ],
    );
  }

  List<PlutoColumn> _buildColumns() {
    List<PlutoColumn> columns = [];

    if (widget.selectable) {
      columns.add(
        PlutoColumn(
          title: widget.showSelectionTitle ? widget.selectionTitle : '',
          field: 'select',
          type: PlutoColumnType.text(),
          enableRowChecked: true,
          readOnly: true,
        ),
      );
    }

    columns.addAll(widget.headers.map((header) {
      return PlutoColumn(
        title: header.name,
        field: header.name.toLowerCase(),
        type: PlutoColumnType.text(),
      );
    }).toList());

    return columns;
  }

  List<PlutoRow> _buildRows() {
    return widget.controller.items.map((item) {
      final cells = {
        'select': PlutoCell(value: selectedItems.contains(item)),
        ...widget.headers.asMap().map((index, header) {
          final value = header.valueGetter != null ? header.valueGetter!(item) : '';
          return MapEntry(header.name.toLowerCase(), PlutoCell(value: value));
        }),
      };

      return PlutoRow(cells: cells);
    }).toList();
  }
}


import 'package:flutter/material.dart';

import '../flutter_crud_table/components/table_header.dart';
import '../flutter_crud_table/data_table/data_table_controller.dart';
import '../flutter_crud_table/data_table/pagination_widget.dart';

// Assuming TableHeader, DataTableController, PaginationWidget, etc., are defined elsewhere.

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
//   // New parameter to specify fixed columns by their indices
//   final List<int> fixedColumnIndices;
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
//     this.fixedColumnIndices = const [0], // Default to fixing the first column
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> selectedItems = {};
//   late ScrollController _horizontalScrollController;
//   late ScrollController _fixedScrollController;
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
//     _fixedScrollController = ScrollController();
//
//     // Synchronize vertical scrolling
//     _horizontalScrollController.addListener(() {
//       if (_fixedScrollController.hasClients) {
//         _fixedScrollController.jumpTo(_horizontalScrollController.offset);
//       }
//     });
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _fixedScrollController.dispose();
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
//     // Split headers into fixed and scrollable based on fixedColumnIndices
//     List<TableHeader<T>> fixedHeaders = [];
//     List<TableHeader<T>> scrollableHeaders = [];
//     for (int i = 0; i < widget.headers.length; i++) {
//       if (widget.fixedColumnIndices.contains(i)) {
//         fixedHeaders.add(widget.headers[i]);
//       } else {
//         scrollableHeaders.add(widget.headers[i]);
//       }
//     }
//
//     // Split items into fixed and scrollable cells
//     List<DataRow> fixedRows = [];
//     List<DataRow> scrollableRows = [];
//     for (final row in widget.controller.items) {
//       List<DataCell> fixedCells = [];
//       List<DataCell> scrollableCells = [];
//
//       for (int i = 0; i < widget.headers.length; i++) {
//         final cell = row.cells[i];
//         if (widget.fixedColumnIndices.contains(i)) {
//           fixedCells.add(cell);
//         } else {
//           scrollableCells.add(cell);
//         }
//       }
//
//       fixedRows.add(DataRow(
//         selected: row.selected,
//         onSelectChanged: row.onSelectChanged,
//         cells: fixedCells,
//       ));
//
//       scrollableRows.add(DataRow(
//         selected: row.selected,
//         onSelectChanged: row.onSelectChanged,
//         cells: scrollableCells,
//       ));
//     }
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
//                   : Row(
//                 children: [
//                   // Fixed Columns
//                   widget.fixedColumnIndices.isNotEmpty
//                       ? Container(
//                     width: widget.fixedColumnIndices.length * 150.0, // Adjust width as needed
//                     child: SingleChildScrollView(
//                       controller: _fixedScrollController,
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
//                         columns: _buildColumns(fixedHeaders, isFixed: true),
//                         rows: _buildRows(fixedRows, isFixed: true),
//                         showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                       ),
//                     ),
//                   )
//                       : const SizedBox(),
//                   // Scrollable Columns
//                   Expanded(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: SingleChildScrollView(
//                         controller: _horizontalScrollController,
//                         scrollDirection: Axis.vertical,
//                         child: DataTable(
//                           border: TableBorder(
//                             verticalInside: BorderSide(
//                               color: Colors.grey, // Color of the vertical line
//                               width: 1, // Thickness of the vertical line
//                             ),
//                             horizontalInside: BorderSide(
//                               color: Colors.grey, // Horizontal lines (optional, for rows)
//                               width: 1,
//                             ),
//                             top: BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                             bottom: BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                             left: BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                             right: BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                           ),
//                           columns: _buildColumns(scrollableHeaders, isFixed: false),
//                           rows: _buildRows(scrollableRows, isFixed: false),
//                           showCheckboxColumn: false, // Disable DataTable's default checkboxes
//                           columnSpacing: 100.0, // Adjust spacing as needed
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
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
//   List<DataColumn> _buildColumns(List<TableHeader<T>> headers, {required bool isFixed}) {
//     List<DataColumn> columns = [];
//
//     // Add a single column for row selection if selectable is enabled and it's not the fixed section
//     if (isFixed && widget.selectable) {
//       columns.add(
//         DataColumn(
//           label: Row(
//             children: [
//               Checkbox(
//                 value: selectedItems.length == widget.controller.items.length &&
//                     widget.controller.items.isNotEmpty
//                     ? true
//                     : selectedItems.isEmpty
//                     ? false
//                     : null, // null represents indeterminate state
//                 onChanged: widget.selectable ? _toggleSelectAll : null,
//                 tristate: true,
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
//     columns.addAll(headers.map((header) {
//       return DataColumn(
//         label: Text(
//           header.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         // Add sorting functionality if needed
//         onSort: header.onSort,
//       );
//     }).toList());
//
//     return columns;
//   }
//
//   List<DataRow> _buildRows(List<DataRow> rows, {required bool isFixed}) {
//     return rows.map((row) {
//       final isSelected = selectedItems.contains(row);
//       List<DataCell> cells = [];
//
//       // Add row-level selection checkbox if selectable is enabled and it's the fixed section
//       if (isFixed && widget.selectable) {
//         cells.add(
//           DataCell(
//             Checkbox(
//               value: isSelected,
//               onChanged: (value) {
//                 _toggleSelected(row as T); // Cast assuming T is compatible
//               },
//             ),
//           ),
//         );
//       }
//
//       // Add the other row cells
//       cells.addAll(row.cells.map((cell) {
//         return DataCell(
//           InkWell(
//             onTap: () {
//               if (widget.onRowTap != null) {
//                 widget.onRowTap!((cell.child is Text ? (cell.child as Text).data as T : cell.child) as T);
//               }
//             },
//             child: cell.child,
//           ),
//         );
//       }).toList());
//
//       return DataRow(
//         selected: isSelected,
//         cells: cells,
//         onSelectChanged: widget.onRowTap != null
//             ? (selected) {
//           if (selected != null && selected) {
//             widget.onRowTap!(row as T); // Cast assuming T is compatible
//           }
//         }
//             : null,
//       );
//     }).toList();
//   }
// }

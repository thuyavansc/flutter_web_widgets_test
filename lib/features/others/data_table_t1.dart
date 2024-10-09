
// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//
// // Signature for [DataColumnT1.onSort] callback.
// typedef DataColumnSortCallback = void Function(int columnIndex, bool ascending);
//
// // Column configuration for a [DataTableT1].
// @immutable
// class DataColumnT1 {
//   const DataColumnT1({
//     required this.label,
//     this.tooltip,
//     this.numeric = false,
//     this.onSort,
//     this.mouseCursor,
//     this.fixedWidth,
//   });
//
//   // The column heading.
//   final Widget label;
//
//   // The column heading's tooltip.
//   final String? tooltip;
//
//   // Whether this column represents numeric data or not.
//   final bool numeric;
//
//   // Called when the user asks to sort the table using this column.
//   final DataColumnSortCallback? onSort;
//
//   // The fixed width for the column, if specified.
//   final double? fixedWidth;
//
//   // The cursor for a mouse pointer when it enters or is hovering over the
//   // heading row.
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
// }
//
// // Row configuration and cell data for a [DataTableT1].
// @immutable
// class DataRowT1 {
//   const DataRowT1({
//     this.key,
//     this.selected = false,
//     this.onSelectChanged,
//     this.onLongPress,
//     this.color,
//     this.mouseCursor,
//     required this.cells,
//   });
//
//   DataRowT1.byIndex({
//     int? index,
//     this.selected = false,
//     this.onSelectChanged,
//     this.onLongPress,
//     this.color,
//     this.mouseCursor,
//     required this.cells,
//   }) : key = ValueKey<int?>(index);
//
//   final LocalKey? key;
//   final ValueChanged<bool?>? onSelectChanged;
//   final GestureLongPressCallback? onLongPress;
//   final bool selected;
//   final List<DataCell> cells;
//   final MaterialStateProperty<Color?>? color;
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
// }
//
// // A Material Design data table with an option for fixed-width columns.
// class DataTableT1 extends StatelessWidget {
//   DataTableT1({
//     super.key,
//     required this.columns,
//     this.sortColumnIndex,
//     this.sortAscending = true,
//     this.onSelectAll,
//     this.decoration,
//     this.dataRowColor,
//     this.dataRowMinHeight,
//     this.dataRowMaxHeight,
//     this.dataTextStyle,
//     this.headingRowColor,
//     this.headingRowHeight,
//     this.headingTextStyle,
//     this.horizontalMargin,
//     this.columnSpacing,
//     this.showCheckboxColumn = true,
//     this.showBottomBorder = false,
//     this.dividerThickness,
//     required this.rows,
//     this.checkboxHorizontalMargin,
//     this.border,
//     this.clipBehavior = Clip.none,
//   });
//
//   final List<DataColumnT1> columns;
//   final int? sortColumnIndex;
//   final bool sortAscending;
//   final ValueSetter<bool?>? onSelectAll;
//   final Decoration? decoration;
//   final WidgetStateProperty<Color?>? dataRowColor;
//   final double? dataRowMinHeight;
//   final double? dataRowMaxHeight;
//   final TextStyle? dataTextStyle;
//   final MaterialStateProperty<Color?>? headingRowColor;
//   final double? headingRowHeight;
//   final TextStyle? headingTextStyle;
//   final double? horizontalMargin;
//   final double? columnSpacing;
//   final bool showCheckboxColumn;
//   final List<DataRowT1> rows;
//   final double? dividerThickness;
//   final bool showBottomBorder;
//   final double? checkboxHorizontalMargin;
//   final TableBorder? border;
//   final Clip clipBehavior;
//
//   static const double _defaultHeadingRowHeight = 56.0;
//   static const double _defaultHorizontalMargin = 24.0;
//   static const double _defaultColumnSpacing = 56.0;
//   static const double _defaultDividerThickness = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final DataTableThemeData dataTableTheme = DataTableTheme.of(context);
//
//     final double effectiveHorizontalMargin = horizontalMargin ?? dataTableTheme.horizontalMargin ?? _defaultHorizontalMargin;
//     final double effectiveColumnSpacing = columnSpacing ?? dataTableTheme.columnSpacing ?? _defaultColumnSpacing;
//     final double effectiveHeadingRowHeight = headingRowHeight ?? dataTableTheme.headingRowHeight ?? _defaultHeadingRowHeight;
//
//     final List<TableColumnWidth> tableColumns = List<TableColumnWidth>.generate(
//       columns.length + (showCheckboxColumn ? 1 : 0),
//           (int index) {
//         if (showCheckboxColumn && index == 0) {
//           return FixedColumnWidth(checkboxHorizontalMargin ?? effectiveHorizontalMargin);
//         }
//         final DataColumnT1 column = columns[showCheckboxColumn ? index - 1 : index];
//         if (column.fixedWidth != null) {
//           return FixedColumnWidth(column.fixedWidth!);
//         }
//         return const IntrinsicColumnWidth();
//       },
//     );
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         decoration: decoration ?? dataTableTheme.decoration ?? theme.dataTableTheme.decoration,
//         child: Material(
//           type: MaterialType.transparency,
//           clipBehavior: clipBehavior,
//           child: Table(
//             columnWidths: tableColumns.asMap(),
//             defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//             children: _buildTableRows(context),
//             border: border,
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<TableRow> _buildTableRows(BuildContext context) {
//     final List<TableRow> tableRows = [];
//
//     // Build header row.
//     tableRows.add(TableRow(
//       children: _buildHeadingCells(context),
//     ));
//
//     // Build data rows.
//     for (final DataRowT1 row in rows) {
//       tableRows.add(TableRow(
//         key: row.key,
//         decoration: BoxDecoration(
//           color: row.color?.resolve({}) ?? dataRowColor?.resolve({}) ?? Colors.transparent,
//         ),
//         children: _buildDataCells(context, row),
//       ));
//     }
//
//     return tableRows;
//   }
//
//   List<Widget> _buildHeadingCells(BuildContext context) {
//     final List<Widget> headingCells = [];
//
//     if (showCheckboxColumn) {
//       headingCells.add(Container(
//         alignment: Alignment.center,
//         child: Checkbox(
//           value: false, // Implement your own logic here if needed.
//           onChanged: onSelectAll,
//         ),
//       ));
//     }
//
//     for (final DataColumnT1 column in columns) {
//       headingCells.add(Container(
//         height: headingRowHeight ?? _defaultHeadingRowHeight,
//         alignment: column.numeric ? Alignment.centerRight : Alignment.centerLeft,
//         padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? _defaultHorizontalMargin / 2),
//         child: column.label,
//       ));
//     }
//
//     return headingCells;
//   }
//
//   List<Widget> _buildDataCells(BuildContext context, DataRowT1 row) {
//     final List<Widget> dataCells = [];
//
//     if (showCheckboxColumn) {
//       dataCells.add(Container(
//         alignment: Alignment.center,
//         child: Checkbox(
//           value: row.selected,
//           onChanged: row.onSelectChanged,
//         ),
//       ));
//     }
//
//     for (final DataCell cell in row.cells) {
//       dataCells.add(Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? _defaultHorizontalMargin / 2),
//         child: cell.child,
//       ));
//     }
//
//     return dataCells;
//   }
// }









//
// // Signature for [DataColumnT1.onSort] callback.
// typedef DataColumnSortCallback = void Function(int columnIndex, bool ascending);
//
// // Column configuration for a [DataTableT1].
// @immutable
// class DataColumnT1 {
//   const DataColumnT1({
//     required this.label,
//     this.tooltip,
//     this.numeric = false,
//     this.onSort,
//     this.mouseCursor,
//     this.fixedWidth,
//   });
//
//   // The column heading.
//   final Widget label;
//
//   // The column heading's tooltip.
//   final String? tooltip;
//
//   // Whether this column represents numeric data or not.
//   final bool numeric;
//
//   // Called when the user asks to sort the table using this column.
//   final DataColumnSortCallback? onSort;
//
//   // The fixed width for the column, if specified.
//   final double? fixedWidth;
//
//   // The cursor for a mouse pointer when it enters or is hovering over the
//   // heading row.
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
// }
//
// // Row configuration and cell data for a [DataTableT1].
// @immutable
// class DataRowT1 {
//   const DataRowT1({
//     this.key,
//     this.selected = false,
//     this.onSelectChanged,
//     this.onLongPress,
//     this.color,
//     this.mouseCursor,
//     required this.cells,
//   });
//
//   DataRowT1.byIndex({
//     int? index,
//     this.selected = false,
//     this.onSelectChanged,
//     this.onLongPress,
//     this.color,
//     this.mouseCursor,
//     required this.cells,
//   }) : key = ValueKey<int?>(index);
//
//   final LocalKey? key;
//   final ValueChanged<bool?>? onSelectChanged;
//   final GestureLongPressCallback? onLongPress;
//   final bool selected;
//   final List<DataCell> cells;
//   final MaterialStateProperty<Color?>? color;
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
// }
//
// // A Material Design data table with an option for fixed-width columns.
// class DataTableT1 extends StatelessWidget {
//   DataTableT1({
//     super.key,
//     required this.columns,
//     this.sortColumnIndex,
//     this.sortAscending = true,
//     this.onSelectAll,
//     this.decoration,
//     this.dataRowColor,
//     this.dataRowMinHeight,
//     this.dataRowMaxHeight,
//     this.dataTextStyle,
//     this.headingRowColor,
//     this.headingRowHeight,
//     this.headingTextStyle,
//     this.horizontalMargin,
//     this.columnSpacing,
//     this.showCheckboxColumn = true,
//     this.showBottomBorder = false,
//     this.dividerThickness,
//     required this.rows,
//     this.checkboxHorizontalMargin,
//     this.border,
//     this.clipBehavior = Clip.none,
//   });
//
//   final List<DataColumnT1> columns;
//   final int? sortColumnIndex;
//   final bool sortAscending;
//   final ValueSetter<bool?>? onSelectAll;
//   final Decoration? decoration;
//   final MaterialStateProperty<Color?>? dataRowColor;
//   final double? dataRowMinHeight;
//   final double? dataRowMaxHeight;
//   final TextStyle? dataTextStyle;
//   final MaterialStateProperty<Color?>? headingRowColor;
//   final double? headingRowHeight;
//   final TextStyle? headingTextStyle;
//   final double? horizontalMargin;
//   final double? columnSpacing;
//   final bool showCheckboxColumn;
//   final List<DataRowT1> rows;
//   final double? dividerThickness;
//   final bool showBottomBorder;
//   final double? checkboxHorizontalMargin;
//   final TableBorder? border;
//   final Clip clipBehavior;
//
//   static const double _defaultHeadingRowHeight = 56.0;
//   static const double _defaultHorizontalMargin = 24.0;
//   static const double _defaultColumnSpacing = 56.0;
//   static const double _defaultDividerThickness = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final DataTableThemeData dataTableTheme = DataTableTheme.of(context);
//
//     final double effectiveHorizontalMargin = horizontalMargin ?? dataTableTheme.horizontalMargin ?? _defaultHorizontalMargin;
//     final double effectiveColumnSpacing = columnSpacing ?? dataTableTheme.columnSpacing ?? _defaultColumnSpacing;
//     final double effectiveHeadingRowHeight = headingRowHeight ?? dataTableTheme.headingRowHeight ?? _defaultHeadingRowHeight;
//
//     final List<TableColumnWidth> tableColumns = List<TableColumnWidth>.generate(
//       columns.length + (showCheckboxColumn ? 1 : 0),
//           (int index) {
//         if (showCheckboxColumn && index == 0) {
//           return FixedColumnWidth(checkboxHorizontalMargin ?? effectiveHorizontalMargin);
//         }
//         final DataColumnT1 column = columns[showCheckboxColumn ? index - 1 : index];
//         if (column.fixedWidth != null) {
//           return FixedColumnWidth(column.fixedWidth!);
//         }
//         return const IntrinsicColumnWidth();
//       },
//     );
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         decoration: decoration ?? dataTableTheme.decoration ?? theme.dataTableTheme.decoration,
//         child: Material(
//           type: MaterialType.transparency,
//           clipBehavior: clipBehavior,
//           child: Table(
//             columnWidths: tableColumns.asMap(),
//             defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//             children: _buildTableRows(context),
//             border: border,
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<TableRow> _buildTableRows(BuildContext context) {
//     final List<TableRow> tableRows = [];
//
//     // Build header row.
//     tableRows.add(TableRow(
//       children: _buildHeadingCells(context),
//     ));
//
//     // Build data rows.
//     for (final DataRowT1 row in rows) {
//       tableRows.add(TableRow(
//         key: row.key,
//         decoration: BoxDecoration(
//           color: row.color?.resolve({}) ?? dataRowColor?.resolve({}) ?? Colors.transparent,
//         ),
//         children: _buildDataCells(context, row),
//       ));
//     }
//
//     return tableRows;
//   }
//
//   List<Widget> _buildHeadingCells(BuildContext context) {
//     final List<Widget> headingCells = [];
//
//     if (showCheckboxColumn) {
//       headingCells.add(Container(
//         alignment: Alignment.center,
//         child: Checkbox(
//           value: false, // Implement your own logic here if needed.
//           onChanged: onSelectAll,
//         ),
//       ));
//     }
//
//     for (final DataColumnT1 column in columns) {
//       headingCells.add(Container(
//         height: headingRowHeight ?? _defaultHeadingRowHeight,
//         alignment: column.numeric ? Alignment.centerRight : Alignment.centerLeft,
//         padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? _defaultHorizontalMargin / 2),
//         child: column.label,
//       ));
//     }
//
//     return headingCells;
//   }
//
//   List<Widget> _buildDataCells(BuildContext context, DataRowT1 row) {
//     final List<Widget> dataCells = [];
//
//     if (showCheckboxColumn) {
//       dataCells.add(Container(
//         alignment: Alignment.center,
//         child: Checkbox(
//           value: row.selected,
//           onChanged: row.onSelectChanged,
//         ),
//       ));
//     }
//
//     for (final DataCell cell in row.cells) {
//       dataCells.add(Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? _defaultHorizontalMargin / 2),
//         child: cell.child,
//       ));
//     }
//
//     return dataCells;
//   }
// }




/// Custom DataTable widget with fixed column width capability and additional features.
///
/// This widget, named `DataTableT1`, extends Flutter's original `DataTable` widget
/// and adds the ability to specify fixed widths for columns, along with horizontal
/// scrolling when content exceeds screen width.
///
/// It retains all the original features of Flutter's `DataTable` widget, including
/// sorting, row selection, custom cell colors, and border styling.
// class DataTableT1 extends StatefulWidget {
//   /// Creates a data table with the given columns and rows.
//   ///
//   /// The [columns] and [rows] arguments must not be null.
//   DataTableT1({
//     Key? key,
//     required this.columns,
//     required this.rows,
//     this.sortColumnIndex,
//     this.sortAscending = true,
//     this.onSelectAll,
//     this.columnSpacing = 56.0,
//     this.horizontalMargin = 24.0,
//     this.showCheckboxColumn = true,
//     this.dataRowHeight = kMinInteractiveDimension,
//     this.headingRowHeight = 56.0,
//     this.dividerThickness = 1.0,
//     this.dataTextStyle,
//     this.headingTextStyle,
//     this.checkboxHorizontalMargin,
//     this.border,
//     this.clipBehavior = Clip.none,
//     this.dataRowColor,
//     this.headingRowColor,
//     this.onRowsPerPageChanged,
//     this.initialFirstRowIndex = 0,
//     this.onPageChanged,
//     this.rowsPerPage = 10,
//   }) : super(key: key);
//
//   /// The columns to display in the table.
//   final List<DataColumnT1> columns;
//
//   /// The rows to display in the table.
//   final List<DataRowT1> rows;
//
//   /// The index of the column by which the data is sorted.
//   final int? sortColumnIndex;
//
//   /// Whether the sorting is ascending or descending.
//   final bool sortAscending;
//
//   /// Called when the user selects or unselects all rows.
//   final ValueSetter<bool?>? onSelectAll;
//
//   /// The spacing between columns.
//   final double columnSpacing;
//
//   /// The horizontal margin around the content.
//   final double horizontalMargin;
//
//   /// Whether to show the checkbox column.
//   final bool showCheckboxColumn;
//
//   /// The height of each data row.
//   final double dataRowHeight;
//
//   /// The height of the heading row.
//   final double headingRowHeight;
//
//   /// The thickness of the dividers between rows.
//   final double dividerThickness;
//
//   /// The text style for data rows.
//   final TextStyle? dataTextStyle;
//
//   /// The text style for heading rows.
//   final TextStyle? headingTextStyle;
//
//   /// The horizontal margin around the checkbox.
//   final double? checkboxHorizontalMargin;
//
//   /// The border for the table.
//   final TableBorder? border;
//
//   /// The clip behavior for the table.
//   final Clip clipBehavior;
//
//   /// The background color for data rows.
//   final WidgetStateProperty<Color?>? dataRowColor;
//
//   /// The background color for the heading row.
//   final WidgetStateProperty<Color?>? headingRowColor;
//
//   /// Called when the number of rows per page is changed.
//   final ValueChanged<int?>? onRowsPerPageChanged;
//
//   /// The initial index of the first row to display.
//   final int initialFirstRowIndex;
//
//   /// Called when the page is changed.
//   final ValueChanged<int>? onPageChanged;
//
//   /// The number of rows per page.
//   final int rowsPerPage;
//
//   @override
//   _DataTableT1State createState() => _DataTableT1State();
// }
//
// /// State class for DataTableT1.
// class _DataTableT1State extends State<DataTableT1> {
//   late ScrollController _scrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   /// Builds the table columns with fixed or flexible widths.
//   List<TableColumnWidth> _getTableColumnWidths() {
//     final List<TableColumnWidth> columnWidths = [];
//     if (widget.showCheckboxColumn) {
//       // Assign a small fixed width for the checkbox column.
//       columnWidths.add(const FixedColumnWidth(50.0));
//     }
//     for (final DataColumnT1 column in widget.columns) {
//       if (column.fixedWidth != null) {
//         // Use FixedColumnWidth if fixedWidth is specified.
//         columnWidths.add(FixedColumnWidth(column.fixedWidth!));
//       } else {
//         // Use IntrinsicColumnWidth for flexible sizing.
//         columnWidths.add(const IntrinsicColumnWidth());
//       }
//     }
//     return columnWidths;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // Provides horizontal scrolling when content exceeds screen width.
//       scrollDirection: Axis.horizontal,
//       controller: _scrollController,
//       child: DataTable(
//         columns: widget.columns
//             .map((column) => DataColumn(
//           label: column.label,
//           tooltip: column.tooltip,
//           numeric: column.numeric,
//           onSort: column.onSort,
//           mouseCursor: column.mouseCursor,
//         ))
//             .toList(),
//         rows: widget.rows
//             .map((row) => DataRow(
//           key: row.key,
//           selected: row.selected,
//           onSelectChanged: row.onSelectChanged,
//           onLongPress: row.onLongPress,
//           color: row.color,
//           mouseCursor: row.mouseCursor,
//           cells: row.cells,
//         ))
//             .toList(),
//         sortColumnIndex: widget.sortColumnIndex,
//         sortAscending: widget.sortAscending,
//         onSelectAll: widget.onSelectAll,
//         columnSpacing: widget.columnSpacing,
//         horizontalMargin: widget.horizontalMargin,
//         showCheckboxColumn: widget.showCheckboxColumn,
//         dataRowHeight: widget.dataRowHeight,
//         headingRowHeight: widget.headingRowHeight,
//         dividerThickness: widget.dividerThickness,
//         dataTextStyle: widget.dataTextStyle,
//         headingTextStyle: widget.headingTextStyle,
//         checkboxHorizontalMargin: widget.checkboxHorizontalMargin,
//         border: widget.border,
//         clipBehavior: widget.clipBehavior,
//         dataRowColor: widget.dataRowColor,
//         headingRowColor: widget.headingRowColor,
//       ),
//     );
//   }
// }
//
// /// Custom DataColumn class with fixedWidth property.
// class DataColumnT1 extends DataColumn {
//   /// Creates a custom data column with an optional fixed width.
//   const DataColumnT1({
//     required Widget label,
//     this.fixedWidth,
//     String? tooltip,
//     bool numeric = false,
//     DataColumnSortCallback? onSort,
//     MaterialStateProperty<MouseCursor?>? mouseCursor,
//   }) : super(
//     label: label,
//     tooltip: tooltip,
//     numeric: numeric,
//     onSort: onSort,
//     mouseCursor: mouseCursor,
//   );
//
//   /// The fixed width for this column.
//   final double? fixedWidth;
// }
//
// /// Custom DataRow class for DataTableT1.
// class DataRowT1 extends DataRow {
//   /// Creates a custom data row.
//   DataRowT1({
//     LocalKey? key,
//     bool selected = false,
//     ValueChanged<bool?>? onSelectChanged,
//     GestureLongPressCallback? onLongPress,
//     MaterialStateProperty<Color?>? color,
//     MaterialStateProperty<MouseCursor?>? mouseCursor,
//     required List<DataCell> cells,
//   }) : super(
//     key: key,
//     selected: selected,
//     onSelectChanged: onSelectChanged,
//     onLongPress: onLongPress,
//     color: color,
//     mouseCursor: mouseCursor,
//     cells: cells,
//   );
// }




// import 'package:flutter/material.dart';
//
// /// Custom DataColumn class with an additional [fixedWidth] parameter.
// @immutable
// class DataColumnT1 {
//   const DataColumnT1({
//     required this.label,
//     this.tooltip,
//     this.numeric = false,
//     this.onSort,
//     this.mouseCursor,
//     this.fixedWidth, // Added fixedWidth parameter
//   });
//
//   /// The column heading widget.
//   final Widget label;
//
//   /// The column heading's tooltip.
//   final String? tooltip;
//
//   /// Whether the column represents numeric data.
//   final bool numeric;
//
//   /// Callback when sorting is triggered on this column.
//   final void Function(int columnIndex, bool ascending)? onSort;
//
//   /// The cursor for a mouse pointer when hovering over the column header.
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
//
//   /// Optional fixed width for the column.
//   final double? fixedWidth;
// }
//
// /// Custom DataRow class for consistency in naming.
// @immutable
// class DataRowT1 {
//   const DataRowT1({
//     this.key,
//     this.selected = false,
//     this.onSelectChanged,
//     this.onLongPress,
//     this.color,
//     this.mouseCursor,
//     required this.cells,
//   });
//
//   final LocalKey? key;
//   final bool selected;
//   final ValueChanged<bool?>? onSelectChanged;
//   final GestureLongPressCallback? onLongPress;
//   final MaterialStateProperty<Color?>? color;
//   final MaterialStateProperty<MouseCursor?>? mouseCursor;
//   final List<DataCell> cells;
// }
//
// /// Custom DataTable widget with fixed column width and additional features.
// class DataTableT1 extends StatelessWidget {
//   const DataTableT1({
//     Key? key,
//     required this.columns,
//     required this.rows,
//     this.sortColumnIndex,
//     this.sortAscending = true,
//     this.onSelectAll,
//     this.decoration,
//     this.dataRowColor,
//     this.dataRowMinHeight,
//     this.dataRowMaxHeight,
//     this.dataTextStyle,
//     this.headingRowColor,
//     this.headingRowHeight,
//     this.headingTextStyle,
//     this.horizontalMargin,
//     this.columnSpacing,
//     this.showCheckboxColumn = true,
//     this.showBottomBorder = false,
//     this.dividerThickness,
//     this.checkboxHorizontalMargin,
//     this.border,
//     this.clipBehavior = Clip.none,
//   }) : super(key: key);
//
//   /// List of column configurations.
//   final List<DataColumnT1> columns;
//
//   /// List of row configurations.
//   final List<DataRowT1> rows;
//
//   /// Index of the column currently sorted.
//   final int? sortColumnIndex;
//
//   /// Whether the sort is ascending.
//   final bool sortAscending;
//
//   /// Callback when "select all" checkbox is toggled.
//   final ValueSetter<bool?>? onSelectAll;
//
//   /// Decoration for the table background and border.
//   final Decoration? decoration;
//
//   /// Background color for data rows.
//   final MaterialStateProperty<Color?>? dataRowColor;
//
//   /// Minimum height for data rows.
//   final double? dataRowMinHeight;
//
//   /// Maximum height for data rows.
//   final double? dataRowMaxHeight;
//
//   /// Text style for data cells.
//   final TextStyle? dataTextStyle;
//
//   /// Background color for the heading row.
//   final MaterialStateProperty<Color?>? headingRowColor;
//
//   /// Height of the heading row.
//   final double? headingRowHeight;
//
//   /// Text style for heading cells.
//   final TextStyle? headingTextStyle;
//
//   /// Horizontal margin around the table content.
//   final double? horizontalMargin;
//
//   /// Spacing between columns.
//   final double? columnSpacing;
//
//   /// Whether to show the checkbox column for row selection.
//   final bool showCheckboxColumn;
//
//   /// Whether to show a border at the bottom of the table.
//   final bool showBottomBorder;
//
//   /// Thickness of dividers between rows.
//   final double? dividerThickness;
//
//   /// Horizontal margin around the checkbox.
//   final double? checkboxHorizontalMargin;
//
//   /// Border style for the table.
//   final TableBorder? border;
//
//   /// Clip behavior for the table content.
//   final Clip clipBehavior;
//
//   /// Handles the "select all" checkbox state.
//   void _handleSelectAll(bool? checked, bool someChecked) {
//     final bool effectiveChecked = someChecked || (checked ?? false);
//     if (onSelectAll != null) {
//       onSelectAll!(effectiveChecked);
//     } else {
//       // If onSelectAll is not provided, toggle selection on each row.
//       // Note: This requires DataTableT1 to be used within a StatefulWidget
//       // where the parent manages the selection state.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine if any row is selectable.
//     final bool anyRowSelectable = rows.any((DataRowT1 row) => row.onSelectChanged != null);
//     final bool displayCheckboxColumn = showCheckboxColumn && anyRowSelectable;
//
//     // Calculate total fixed width for columns with fixedWidth set.
//     double totalFixedWidth = 0.0;
//     for (final column in columns) {
//       if (column.fixedWidth != null) {
//         totalFixedWidth += column.fixedWidth!;
//       }
//     }
//
//     // Define column widths based on fixedWidth or IntrinsicColumnWidth.
//     final List<TableColumnWidth> tableColumnWidths = [];
//     if (displayCheckboxColumn) {
//       // Assign a small fixed width for the checkbox column.
//       tableColumnWidths.add(const FixedColumnWidth(56.0));
//     }
//     for (final column in columns) {
//       if (column.fixedWidth != null) {
//         tableColumnWidths.add(FixedColumnWidth(column.fixedWidth!));
//       } else {
//         tableColumnWidths.add(IntrinsicColumnWidth());
//       }
//     }
//
//     // Build the table header row.
//     List<Widget> headerCells = [];
//     if (displayCheckboxColumn) {
//       // "Select All" checkbox in the header.
//       headerCells.add(
//         Checkbox(
//           value: rows.where((row) => row.onSelectChanged != null && row.selected).length == rows.where((row) => row.onSelectChanged != null).length
//               ? true
//               : null, // null represents someChecked (tristate)
//           onChanged: anyRowSelectable
//               ? (bool? checked) {
//             _handleSelectAll(checked, checked == null);
//           }
//               : null,
//         ),
//       );
//     }
//     for (int i = 0; i < columns.length; i++) {
//       final column = columns[i];
//       headerCells.add(
//         InkWell(
//           onTap: column.onSort != null
//               ? () {
//             // Toggle sort order if the same column is tapped, else default to ascending.
//             final bool ascending = sortColumnIndex != i || !sortAscending;
//             column.onSort!(i, ascending);
//           }
//               : null,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 column.label,
//                 if (column.onSort != null)
//                   Icon(
//                     sortColumnIndex == i
//                         ? (sortAscending ? Icons.arrow_upward : Icons.arrow_downward)
//                         : Icons.unfold_more,
//                     size: 16.0,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//     // Build the table data rows.
//     List<TableRow> tableRows = [];
//     // Add header row.
//     tableRows.add(
//       TableRow(
//         children: headerCells,
//       ),
//     );
//
//     // Add data rows.
//     for (final row in rows) {
//       List<Widget> rowCells = [];
//       if (displayCheckboxColumn) {
//         rowCells.add(
//           Checkbox(
//             value: row.selected,
//             onChanged: row.onSelectChanged,
//           ),
//         );
//       }
//       for (int i = 0; i < row.cells.length; i++) {
//         final cell = row.cells[i];
//         rowCells.add(
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: cell.child,
//           ),
//         );
//       }
//       tableRows.add(
//         TableRow(
//           decoration: BoxDecoration(
//             color: row.color?.resolve({}) ?? Colors.transparent,
//           ),
//           children: rowCells,
//         ),
//       );
//     }
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Scrollbar(
//         child: Table(
//           columnWidths: Map.fromIterables(
//             List<int>.generate(tableColumnWidths.length, (index) => index),
//             tableColumnWidths,
//           ),
//           border: border,
//           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//           children: tableRows,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

/// Custom DataColumn class with an additional [fixedWidth] parameter.
@immutable
class DataColumnT1 {
  const DataColumnT1({
    required this.label,
    this.tooltip,
    this.numeric = false,
    this.onSort,
    this.mouseCursor,
    this.fixedWidth, // Added fixedWidth parameter
  });

  /// The column heading widget.
  final Widget label;

  /// The column heading's tooltip.
  final String? tooltip;

  /// Whether the column represents numeric data.
  final bool numeric;

  /// Callback when sorting is triggered on this column.
  final void Function(int columnIndex, bool ascending)? onSort;

  /// The cursor for a mouse pointer when hovering over the column header.
  final MaterialStateProperty<MouseCursor?>? mouseCursor;

  /// Optional fixed width for the column.
  final double? fixedWidth;
}

/// Custom DataRow class for consistency in naming.
@immutable
class DataRowT1 {
  const DataRowT1({
    this.key,
    this.selected = false,
    this.onSelectChanged,
    this.onLongPress,
    this.color,
    this.mouseCursor,
    required this.cells,
  });

  final LocalKey? key;
  final bool selected;
  final ValueChanged<bool?>? onSelectChanged;
  final GestureLongPressCallback? onLongPress;
  final MaterialStateProperty<Color?>? color;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final List<DataCell> cells;
}

/// Custom DataTable widget with fixed column width and additional features.
class DataTableT1 extends StatelessWidget {
  const DataTableT1({
    Key? key,
    required this.columns,
    required this.rows,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.decoration,
    this.dataRowColor,
    this.dataRowMinHeight,
    this.dataRowMaxHeight,
    this.dataTextStyle,
    this.headingRowColor,
    this.headingRowHeight,
    this.headingTextStyle,
    this.horizontalMargin,
    this.columnSpacing,
    this.showCheckboxColumn = true,
    this.showBottomBorder = false,
    this.dividerThickness,
    this.checkboxHorizontalMargin,
    this.border,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  /// List of column configurations.
  final List<DataColumnT1> columns;

  /// List of row configurations.
  final List<DataRowT1> rows;

  /// Index of the column currently sorted.
  final int? sortColumnIndex;

  /// Whether the sort is ascending.
  final bool sortAscending;

  /// Callback when "select all" checkbox is toggled.
  final ValueSetter<bool?>? onSelectAll;

  /// Decoration for the table background and border.
  final Decoration? decoration;

  /// Background color for data rows.
  final MaterialStateProperty<Color?>? dataRowColor;

  /// Minimum height for data rows.
  final double? dataRowMinHeight;

  /// Maximum height for data rows.
  final double? dataRowMaxHeight;

  /// Text style for data cells.
  final TextStyle? dataTextStyle;

  /// Background color for the heading row.
  final MaterialStateProperty<Color?>? headingRowColor;

  /// Height of the heading row.
  final double? headingRowHeight;

  /// Text style for heading cells.
  final TextStyle? headingTextStyle;

  /// Horizontal margin around the table content.
  final double? horizontalMargin;

  /// Spacing between columns.
  final double? columnSpacing;

  /// Whether to show the checkbox column for row selection.
  final bool showCheckboxColumn;

  /// Whether to show a border at the bottom of the table.
  final bool showBottomBorder;

  /// Thickness of dividers between rows.
  final double? dividerThickness;

  /// Horizontal margin around the checkbox.
  final double? checkboxHorizontalMargin;

  /// Border style for the table.
  final TableBorder? border;

  /// Clip behavior for the table content.
  final Clip clipBehavior;

  /// Handles the "select all" checkbox state.
  void _handleSelectAll(bool? checked, bool someChecked) {
    final bool effectiveChecked = someChecked || (checked ?? false);
    if (onSelectAll != null) {
      onSelectAll!(effectiveChecked);
    } else {
      // If onSelectAll is not provided, toggle selection on each row.
      // Note: This requires DataTableT1 to be used within a StatefulWidget
      // where the parent manages the selection state.
      // Alternatively, you can manage state here if you convert DataTableT1 to StatefulWidget.
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine if any row is selectable.
    final bool anyRowSelectable = rows.any((DataRowT1 row) => row.onSelectChanged != null);
    final bool displayCheckboxColumn = showCheckboxColumn && anyRowSelectable;

    // Define column widths based on fixedWidth or IntrinsicColumnWidth.
    final List<TableColumnWidth> tableColumnWidths = [];
    if (displayCheckboxColumn) {
      // Assign a fixed width for the checkbox column.
      tableColumnWidths.add(const FixedColumnWidth(56.0));
    }
    for (final column in columns) {
      if (column.fixedWidth != null) {
        tableColumnWidths.add(FixedColumnWidth(column.fixedWidth!));
      } else {
        tableColumnWidths.add(const IntrinsicColumnWidth());
      }
    }

    // Build the table header row.
    List<Widget> headerCells = [];
    if (displayCheckboxColumn) {
      // "Select All" checkbox in the header.
      headerCells.add(
        Checkbox(
          value: rows.where((row) => row.onSelectChanged != null && row.selected).length ==
              rows.where((row) => row.onSelectChanged != null).length
              ? true
              : rows.where((row) => row.onSelectChanged != null && row.selected).isEmpty
              ? false
              : null, // null represents indeterminate state
          onChanged: anyRowSelectable
              ? (bool? checked) {
            _handleSelectAll(checked, checked == null);
          }
              : null,
          tristate: true, // Enable tristate for indeterminate
        ),
      );
    }
    for (int i = 0; i < columns.length; i++) {
      final column = columns[i];
      headerCells.add(
        InkWell(
          onTap: column.onSort != null
              ? () {
            // Toggle sort order if the same column is tapped, else default to ascending.
            final bool ascending = sortColumnIndex != i || !sortAscending;
            column.onSort!(i, ascending);
          }
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                column.label,
                if (column.onSort != null)
                  Icon(
                    sortColumnIndex == i
                        ? (sortAscending ? Icons.arrow_upward : Icons.arrow_downward)
                        : Icons.unfold_more,
                    size: 16.0,
                  ),
              ],
            ),
          ),
        ),
      );
    }

    // Build the table data rows.
    List<TableRow> tableRows = [];
    // Add header row.
    tableRows.add(
      TableRow(
        children: headerCells,
      ),
    );

    // Add data rows.
    for (final row in rows) {
      List<Widget> rowCells = [];
      if (displayCheckboxColumn) {
        rowCells.add(
          Checkbox(
            value: row.selected,
            onChanged: row.onSelectChanged,
          ),
        );
      }
      for (int i = 0; i < row.cells.length; i++) {
        final cell = row.cells[i];
        rowCells.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: cell.child,
          ),
        );
      }
      tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            color: row.color?.resolve({}) ?? Colors.transparent,
          ),
          children: rowCells,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Scrollbar(
        child: Table(
          columnWidths: Map.fromIterables(
            List<int>.generate(tableColumnWidths.length, (index) => index),
            tableColumnWidths,
          ),
          border: border,
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: tableRows,
        ),
      ),
    );
  }
}

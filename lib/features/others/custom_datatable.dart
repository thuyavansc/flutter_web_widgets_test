import 'package:flutter/material.dart';

// class CustomDataTable extends StatelessWidget {
//   final List<DataColumn> columns;
//   final List<DataRow> rows;
//   final bool selectable;
//   final bool showSelectionTitle;
//   final String selectionTitle;
//   final ValueChanged<bool?>? onSelectAll;
//
//   const CustomDataTable({
//     Key? key,
//     required this.columns,
//     required this.rows,
//     this.selectable = false,
//     this.showSelectionTitle = false,
//     this.selectionTitle = 'Select',
//     this.onSelectAll,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: _buildCustomColumns(),
//       rows: _buildCustomRows(),
//       showCheckboxColumn: false, // Disables default checkboxes
//     );
//   }
//
//   List<DataColumn> _buildCustomColumns() {
//     List<DataColumn> customColumns = [];
//
//     if (selectable) {
//       customColumns.add(
//         DataColumn(
//           label: Row(
//             children: [
//               Checkbox(
//                 value: rows.isNotEmpty && rows.every((row) => row.selected),
//                 onChanged: (bool? value) {
//                   if (onSelectAll != null) {
//                     onSelectAll!(value);
//                   }
//                 },
//               ),
//               if (showSelectionTitle) ...[
//                 const SizedBox(width: 4),
//                 Text(selectionTitle),
//               ],
//             ],
//           ),
//         ),
//       );
//     }
//
//     // Add the rest of the columns
//     customColumns.addAll(columns);
//
//     return customColumns;
//   }
//
//   List<DataRow> _buildCustomRows() {
//     return rows.map((DataRow row) {
//       List<DataCell> customCells = [];
//
//       // Add a checkbox cell for each row if selectable is enabled
//       if (selectable) {
//         customCells.add(
//           DataCell(
//             Checkbox(
//               value: row.selected,
//               onChanged: (bool? value) {
//                 if (row.onSelectChanged != null) {
//                   row.onSelectChanged!(value ?? false);
//                 }
//               },
//             ),
//           ),
//         );
//       }
//
//       // Add the rest of the cells
//       customCells.addAll(row.cells);
//
//       return DataRow(
//         key: row.key,
//         selected: row.selected,
//         onSelectChanged: row.onSelectChanged,
//         cells: customCells,
//       );
//     }).toList();
//   }
// }
//
// class CustomDataTableExample extends StatefulWidget {
//   @override
//   _CustomDataTableExampleState createState() => _CustomDataTableExampleState();
// }
//
// class _CustomDataTableExampleState extends State<CustomDataTableExample> {
//   List<Item> items = [
//     Item(id: 1, name: 'David Jones', email: 'david.jones@mail.com'),
//     Item(id: 2, name: 'Charles White', email: 'charles.white@test.org'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Custom Data Table Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: CustomDataTable(
//           columns: [
//             DataColumn(
//               label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             DataColumn(
//               label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             DataColumn(
//               label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//           ],
//           rows: _buildRows(),
//           selectable: true,
//           showSelectionTitle: true,
//           selectionTitle: 'Select',
//           onSelectAll: _toggleSelectAll,
//         ),
//       ),
//     );
//   }
//
//   List<DataRow> _buildRows() {
//     return items.map((item) {
//       return DataRow(
//         selected: item.selected,
//         onSelectChanged: (bool? selected) {
//           setState(() {
//             item.selected = selected ?? false;
//           });
//         },
//         cells: [
//           DataCell(Text(item.id.toString())),
//           DataCell(Text(item.name)),
//           DataCell(Text(item.email)),
//         ],
//       );
//     }).toList();
//   }
//
//   void _toggleSelectAll(bool? value) {
//     setState(() {
//       for (var item in items) {
//         item.selected = value ?? false;
//       }
//     });
//   }
// }
//
// class Item {
//   final int id;
//   final String name;
//   final String email;
//   bool selected;
//
//   Item({required this.id, required this.name, required this.email, this.selected = false});
// }



import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomDataTable extends DataTable {
  final double fixedSelectionColumnWidth;

  CustomDataTable({
    Key? key,
    required List<DataColumn> columns,
    required List<DataRow> rows,
    bool showCheckboxColumn = true,
    int? sortColumnIndex,
    bool sortAscending = true,
    ValueSetter<bool?>? onSelectAll,
    double? columnSpacing,
    double? horizontalMargin,
    double? dividerThickness,
    this.fixedSelectionColumnWidth = 50.0,
    Decoration? decoration,
    bool showBottomBorder = false,
    double? checkboxHorizontalMargin,
    Clip clipBehavior = Clip.none,
  }) : super(
    key: key,
    columns: columns,
    rows: rows,
    sortColumnIndex: sortColumnIndex,
    sortAscending: sortAscending,
    showCheckboxColumn: showCheckboxColumn,
    onSelectAll: onSelectAll,
    columnSpacing: columnSpacing,
    horizontalMargin: horizontalMargin,
    dividerThickness: dividerThickness,
    showBottomBorder: showBottomBorder,
    checkboxHorizontalMargin: checkboxHorizontalMargin,
    decoration: decoration,
    clipBehavior: clipBehavior,
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool anyRowSelectable = rows.any((DataRow row) => row.onSelectChanged != null);
    final bool displayCheckboxColumn = showCheckboxColumn && anyRowSelectable;

    List<TableColumnWidth> tableColumns = [];
    if (displayCheckboxColumn) {
      tableColumns.add(FixedColumnWidth(fixedSelectionColumnWidth));
    }

    tableColumns.addAll(List<TableColumnWidth>.filled(
        columns.length, const IntrinsicColumnWidth()));

    return Container(
      decoration: decoration ?? theme.dataTableTheme.decoration,
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: clipBehavior,
        child: Table(
          columnWidths: Map<int, TableColumnWidth>.fromEntries(
              tableColumns.asMap().entries.map((e) => MapEntry(e.key, e.value))),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: _buildTableRows(context),
          border: border,
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool anyRowSelectable = rows.any((DataRow row) => row.onSelectChanged != null);
    final bool displayCheckboxColumn = showCheckboxColumn && anyRowSelectable;

    return [
      TableRow(
        children: _buildHeadingCells(context, displayCheckboxColumn),
      ),
      ...rows.map((DataRow row) {
        return TableRow(
          key: row.key,
          children: _buildDataCells(context, row, displayCheckboxColumn),
        );
      }).toList(),
    ];
  }

  List<Widget> _buildHeadingCells(BuildContext context, bool displayCheckboxColumn) {
    List<Widget> cells = [];

    if (displayCheckboxColumn) {
      cells.add(Container(
        width: fixedSelectionColumnWidth,
        alignment: Alignment.center,
        child: Checkbox(
          value: false, // Add logic for select all functionality if required
          onChanged: null,
        ),
      ));
    }

    cells.addAll(columns.map((DataColumn column) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: column.label,
      );
    }).toList());

    return cells;
  }

  List<Widget> _buildDataCells(BuildContext context, DataRow row, bool displayCheckboxColumn) {
    List<Widget> cells = [];

    if (displayCheckboxColumn) {
      cells.add(Container(
        width: fixedSelectionColumnWidth,
        alignment: Alignment.center,
        child: Checkbox(
          value: row.selected,
          onChanged: row.onSelectChanged,
        ),
      ));
    }

    cells.addAll(row.cells.map((DataCell cell) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: cell.child,
      );
    }).toList());

    return cells;
  }
}




//Apply this
// CustomDataTable(
// columns: [
// DataColumn(label: Text('Name')),
// DataColumn(label: Text('Age')),
// DataColumn(label: Text('Age')),
// DataColumn(label: Text('Age')),
// ],
// rows: [
// DataRow(
// cells: [
// DataCell(Text('Alice')),
// DataCell(Text('25')),
// DataCell(Text('25')),
// DataCell(Text('25')),
// ],
// ),
// DataRow(
// cells: [
// DataCell(Text('Bob')),
// DataCell(Text('30')),
// DataCell(Text('30')),
// DataCell(Text('30')),
// ],
// ),
// ],
// showCheckboxColumn: true,
// fixedSelectionColumnWidth: 50.0, // Set the width as needed
// ):
import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool selectable;
  final bool showSelectionTitle;
  final String selectionTitle;
  final ValueChanged<bool?>? onSelectAll;

  const CustomDataTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.selectable = false,
    this.showSelectionTitle = false,
    this.selectionTitle = 'Select',
    this.onSelectAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _buildCustomColumns(),
      rows: _buildCustomRows(),
      showCheckboxColumn: false, // Disables default checkboxes
    );
  }

  List<DataColumn> _buildCustomColumns() {
    List<DataColumn> customColumns = [];

    if (selectable) {
      customColumns.add(
        DataColumn(
          label: Row(
            children: [
              Checkbox(
                value: rows.isNotEmpty && rows.every((row) => row.selected),
                onChanged: (bool? value) {
                  if (onSelectAll != null) {
                    onSelectAll!(value);
                  }
                },
              ),
              if (showSelectionTitle) ...[
                const SizedBox(width: 4),
                Text(selectionTitle),
              ],
            ],
          ),
        ),
      );
    }

    // Add the rest of the columns
    customColumns.addAll(columns);

    return customColumns;
  }

  List<DataRow> _buildCustomRows() {
    return rows.map((DataRow row) {
      List<DataCell> customCells = [];

      // Add a checkbox cell for each row if selectable is enabled
      if (selectable) {
        customCells.add(
          DataCell(
            Checkbox(
              value: row.selected,
              onChanged: (bool? value) {
                if (row.onSelectChanged != null) {
                  row.onSelectChanged!(value ?? false);
                }
              },
            ),
          ),
        );
      }

      // Add the rest of the cells
      customCells.addAll(row.cells);

      return DataRow(
        key: row.key,
        selected: row.selected,
        onSelectChanged: row.onSelectChanged,
        cells: customCells,
      );
    }).toList();
  }
}

class CustomDataTableExample extends StatefulWidget {
  @override
  _CustomDataTableExampleState createState() => _CustomDataTableExampleState();
}

class _CustomDataTableExampleState extends State<CustomDataTableExample> {
  List<Item> items = [
    Item(id: 1, name: 'David Jones', email: 'david.jones@mail.com'),
    Item(id: 2, name: 'Charles White', email: 'charles.white@test.org'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Data Table Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomDataTable(
          columns: [
            DataColumn(
              label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
          rows: _buildRows(),
          selectable: true,
          showSelectionTitle: true,
          selectionTitle: 'Select',
          onSelectAll: _toggleSelectAll,
        ),
      ),
    );
  }

  List<DataRow> _buildRows() {
    return items.map((item) {
      return DataRow(
        selected: item.selected,
        onSelectChanged: (bool? selected) {
          setState(() {
            item.selected = selected ?? false;
          });
        },
        cells: [
          DataCell(Text(item.id.toString())),
          DataCell(Text(item.name)),
          DataCell(Text(item.email)),
        ],
      );
    }).toList();
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      for (var item in items) {
        item.selected = value ?? false;
      }
    });
  }
}

class Item {
  final int id;
  final String name;
  final String email;
  bool selected;

  Item({required this.id, required this.name, required this.email, this.selected = false});
}


import 'package:flutter/material.dart';

import '../../others/data_table_t1.dart';

// class DataTableT1Example extends StatefulWidget {
//   @override
//   _DataTableT1ExampleState createState() => _DataTableT1ExampleState();
// }
//
// class _DataTableT1ExampleState extends State<DataTableT1Example> {
//   int? _sortColumnIndex;
//   bool _sortAscending = true;
//   List<RowData> _data = [
//     RowData(name: 'Alice', age: 30, role: 'Developer'),
//     RowData(name: 'Bob', age: 25, role: 'Designer'),
//     RowData(name: 'Charlie', age: 35, role: 'Manager'),
//   ];
//
//   void _onSort(int columnIndex, bool ascending) {
//     setState(() {
//       _sortColumnIndex = columnIndex;
//       _sortAscending = ascending;
//       if (columnIndex == 0) {
//         _data.sort((a, b) => ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
//       } else if (columnIndex == 1) {
//         _data.sort((a, b) => ascending ? a.age.compareTo(b.age) : b.age.compareTo(a.age));
//       } else if (columnIndex == 2) {
//         _data.sort((a, b) => ascending ? a.role.compareTo(b.role) : b.role.compareTo(a.role));
//       }
//     });
//   }
//
//   void _onSelectAll(bool? selected) {
//     setState(() {
//       for (var row in _data) {
//         row.selected = selected ?? false;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<DataColumnT1> columns = [
//       DataColumnT1(
//         label: Text('Name'),
//         onSort: _onSort,
//         fixedWidth: 150.0, // Fixed width for the Name column
//       ),
//       DataColumnT1(
//         label: Text('Age'),
//         numeric: true,
//         onSort: _onSort,
//         fixedWidth: 80.0, // Fixed width for the Age column
//       ),
//       DataColumnT1(
//         label: Text('Role'),
//         onSort: _onSort,
//         // No fixedWidth, will be flexible
//       ),
//     ];
//
//     List<DataRowT1> rows = _data.map((rowData) {
//       return DataRowT1(
//         selected: rowData.selected,
//         onSelectChanged: (selected) {
//           setState(() {
//             rowData.selected = selected ?? false;
//           });
//         },
//         cells: [
//           DataCell(Text(rowData.name)),
//           DataCell(Text(rowData.age.toString())),
//           DataCell(Text(rowData.role)),
//         ],
//       );
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(title: Text('DataTableT1 Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: DataTableT1(
//           columns: columns,
//           rows: rows,
//           sortColumnIndex: _sortColumnIndex,
//           sortAscending: _sortAscending,
//           onSelectAll: _onSelectAll,
//           showCheckboxColumn: true,
//           headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
//           dataRowColor: MaterialStateProperty.resolveWith<Color?>(
//                 (Set<MaterialState> states) {
//               if (states.contains(MaterialState.selected)) {
//                 return Colors.blue.withOpacity(0.2);
//               }
//               return null; // Use default color
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RowData {
//   RowData({required this.name, required this.age, required this.role, this.selected = false});
//
//   String name;
//   int age;
//   String role;
//   bool selected;
// }



import 'package:flutter/material.dart';

// Assuming DataColumnT1, DataRowT1, and DataTableT1 are defined as above.

class DataTableT1Example extends StatefulWidget {
  @override
  _DataTableT1ExampleState createState() => _DataTableT1ExampleState();
}

class _DataTableT1ExampleState extends State<DataTableT1Example> {
  int? _sortColumnIndex;
  bool _sortAscending = true;
  List<RowData> _data = [
    RowData(name: 'Alice', age: 30, role: 'Developer'),
    RowData(name: 'Bob', age: 25, role: 'Designer'),
    RowData(name: 'Charlie', age: 35, role: 'Manager'),
    RowData(name: 'Diana', age: 28, role: 'QA'),
  ];

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      if (columnIndex == 0) {
        _data.sort((a, b) =>
        ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
      } else if (columnIndex == 1) {
        _data.sort((a, b) =>
        ascending ? a.age.compareTo(b.age) : b.age.compareTo(a.age));
      } else if (columnIndex == 2) {
        _data.sort((a, b) =>
        ascending ? a.role.compareTo(b.role) : b.role.compareTo(a.role));
      }
    });
  }

  void _onSelectAll(bool? selected) {
    setState(() {
      for (var row in _data) {
        row.selected = selected ?? false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumnT1> columns = [
      DataColumnT1(
        label: Text('Name'),
        onSort: _onSort,
        //fixedWidth: 150.0, // Fixed width for the Name column
      ),
      DataColumnT1(
        label: Text('Age'),
        numeric: true,
        onSort: _onSort,
        //fixedWidth: 80.0, // Fixed width for the Age column
      ),
      DataColumnT1(
        label: Text('Role'),
        onSort: _onSort,
        // No fixedWidth, will be flexible
      ),
    ];

    List<DataRowT1> rows = _data.map((rowData) {
      return DataRowT1(
        selected: rowData.selected,
        onSelectChanged: (selected) {
          setState(() {
            rowData.selected = selected ?? false;
          });
        },
        cells: [
          DataCell(Text(rowData.name)),
          DataCell(Text(rowData.age.toString())),
          DataCell(Text(rowData.role)),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('DataTableT1 Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: DataTableT1(
            columns: columns,
            rows: rows,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            onSelectAll: _onSelectAll,
            showCheckboxColumn: true,
            headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
            dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.blue.withOpacity(0.2);
                }
                return null; // Use default color
              },
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}

class RowData {
  RowData({
    required this.name,
    required this.age,
    required this.role,
    this.selected = false,
  });

  String name;
  int age;
  String role;
  bool selected;
}

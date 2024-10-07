
// example/simple_table.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import '../data_table/data_table_controller.dart';
import '../data_table/data_table_widget.dart';



// class SimpleTableExample extends StatelessWidget {
//   final List<Map<String, dynamic>> data = [
//     {'Name': 'Alice', 'Age': 25, 'Email': 'alice@example.com'},
//     {'Name': 'Bob', 'Age': 30, 'Email': 'bob@example.com'},
//     {'Name': 'Charlie', 'Age': 35, 'Email': 'charlie@example.com'},
//   ];
//
//   SimpleTableExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final headers = [
//       TableHeader<Map<String, dynamic>>(
//         name: 'Name',
//         valueGetter: (item) => item['Name'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Age',
//         valueGetter: (item) => item['Age'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Email',
//         valueGetter: (item) => item['Email'].toString(),
//       ),
//     ];
//
//     final controller = DataTableController<Map<String, dynamic>>(
//       initialItems: data,
//     );
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Simple Table')),
//       body: DataTableWidget<Map<String, dynamic>>(
//         headers: headers,
//         controller: controller,
//         showSearch: false,
//         showPagination: false,
//       ),
//     );
//   }
// }

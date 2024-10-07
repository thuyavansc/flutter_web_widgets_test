
// example/data_table_example.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import '../data_table/data_table_controller.dart';
import '../data_table/data_table_widget.dart';
import 'api_service.dart';
import 'item_model.dart';

// class DataTableExample extends StatelessWidget {
//   final List<Map<String, dynamic>> data = List.generate(
//     100,
//         (index) => {
//       'ID': index + 1,
//       'Name': 'Item ${index + 1}',
//       'Price': (index + 1) * 10.0,
//     },
//   );
//
//   DataTableExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final headers = [
//       TableHeader<Map<String, dynamic>>(
//         name: 'ID',
//         valueGetter: (item) => item['ID'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Name',
//         valueGetter: (item) => item['Name'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Price',
//         valueGetter: (item) => '\$${item['Price'].toStringAsFixed(2)}',
//       ),
//     ];
//
//     final controller = DataTableController<Map<String, dynamic>>(
//       initialItems: data,
//     );
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Data Table with Pagination and Search')),
//       body: DataTableWidget<Map<String, dynamic>>(
//         headers: headers,
//         controller: controller,
//       ),
//     );
//   }
// }




class DataTableExample extends StatelessWidget {
  DataTableExample({Key? key}) : super(key: key);

  final DataTableController<Item> controller = DataTableController<Item>(
    dataFetcher: fetchItems,
  );

  @override
  Widget build(BuildContext context) {
    final headers = [
      TableHeader<Item>(
        name: 'ID',
        valueGetter: (item) => item.id.toString(),
      ),
      TableHeader<Item>(
        name: 'Name',
        valueGetter: (item) => item.name,
      ),
      TableHeader<Item>(
        name: 'Email',
        valueGetter: (item) => item.email,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Data Table Example')),
      body: DataTableWidget<Item>(
        headers: headers,
        controller: controller,
      ),
    );
  }
}

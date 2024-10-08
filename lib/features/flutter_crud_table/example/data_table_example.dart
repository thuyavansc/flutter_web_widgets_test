
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



//Working example
// class DataTableExample extends StatelessWidget {
//   DataTableExample({Key? key}) : super(key: key);
//
//   final DataTableController<Item> controller = DataTableController<Item>(
//     dataFetcher: fetchItems,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final headers = [
//       TableHeader<Item>(
//         name: 'ID',
//         valueGetter: (item) => item.id.toString(),
//       ),
//       TableHeader<Item>(
//         name: 'Name',
//         valueGetter: (item) => item.name,
//       ),
//       TableHeader<Item>(
//         name: 'Email',
//         valueGetter: (item) => item.email,
//       ),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Data Table Example')),
//       body: DataTableWidget<Item>(
//         headers: headers,
//         controller: controller,
//       ),
//     );
//   }
// }




class DataTableExample extends StatefulWidget {
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  late DataTableController<Item> controller;
  List<Item> selectedItems = [];

  @override
  void initState() {
    super.initState();
    controller = DataTableController<Item>(
      dataFetcher: fetchItems,
    );
  }


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
        selectable: true,
        selectedItems: selectedItems,
        onSelectionChanged: (selected) {
          setState(() {
            selectedItems = selected;
          });
        },
        // expandable: true,
        // expandedBuilder: (item) {
        //   return Container(
        //     padding: const EdgeInsets.all(8.0),
        //     color: Colors.grey[100],
        //     child: Text('Details: ${item.details}'),
        //   );
        // },
        onRowTap: (item) {
          // Handle row tap if needed
          print('Row tapped: ${item.name}');
        },
        showSelectionTitle: true,
        selectionTitle: 'Select',
      ),
    );
  }
}

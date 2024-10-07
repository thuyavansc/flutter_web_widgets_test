
// example/api_data_table_example.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import '../data_table/data_table_controller.dart';
import '../data_table/data_table_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class ApiDataTableExample extends StatefulWidget {
//   const ApiDataTableExample({Key? key}) : super(key: key);
//
//   @override
//   _ApiDataTableExampleState createState() => _ApiDataTableExampleState();
// }
//
// class _ApiDataTableExampleState extends State<ApiDataTableExample> {
//   late DataTableController<Map<String, dynamic>> controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = DataTableController<Map<String, dynamic>>(initialItems: []);
//     _fetchData();
//   }
//
//   Future<void> _fetchData() async {
//     controller.isLoading = true;
//     setState(() {});
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonData = json.decode(response.body);
//       controller.setItems(jsonData.cast<Map<String, dynamic>>());
//     }
//     controller.isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final headers = [
//       TableHeader<Map<String, dynamic>>(
//         name: 'ID',
//         valueGetter: (item) => item['id'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Name',
//         valueGetter: (item) => item['name'].toString(),
//       ),
//       TableHeader<Map<String, dynamic>>(
//         name: 'Email',
//         valueGetter: (item) => item['email'].toString(),
//       ),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Data Table from API')),
//       body: controller.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : DataTableWidget<Map<String, dynamic>>(
//         headers: headers,
//         controller: controller,
//       ),
//     );
//   }
// }






class ApiDataTableExample extends StatefulWidget {
  const ApiDataTableExample({Key? key}) : super(key: key);

  @override
  _ApiDataTableExampleState createState() => _ApiDataTableExampleState();
}

class _ApiDataTableExampleState extends State<ApiDataTableExample> {
  late DataTableController<Map<String, dynamic>> controller;

  @override
  void initState() {
    super.initState();

    controller = DataTableController<Map<String, dynamic>>(
      dataFetcher: fetchDataPage,
      debounceDuration: const Duration(seconds: 2),
    );
  }

  Future<DataPage<Map<String, dynamic>>> fetchDataPage(int page, int itemsPerPage, String searchQuery) async {
    // Replace with your actual API endpoint
    //final apiUrl = 'https://api.example.com/items?page=$page&limit=$itemsPerPage&search=$searchQuery';
    //final apiUrl = 'http://localhost:3000/api/items?page=$page&limit=$itemsPerPage';
    final apiUrl = 'http://localhost:3000/api/items?page=$page&limit=$itemsPerPage&search=$searchQuery';
    http://localhost:3000/api/items?page=2&limit=20


    print('API Call : $apiUrl');

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      final List<dynamic> itemsJson = jsonData['items'];
      final int totalItems = jsonData['totalItems'];

      List<Map<String, dynamic>> items = itemsJson.cast<Map<String, dynamic>>();

      print('API Call items : $items');

      return DataPage(items: items, totalItems: totalItems);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final headers = [
      TableHeader<Map<String, dynamic>>(
        name: 'ID',
        valueGetter: (item) => item['id'].toString(),
      ),
      TableHeader<Map<String, dynamic>>(
        name: 'Name',
        valueGetter: (item) => item['name'].toString(),
      ),
      TableHeader<Map<String, dynamic>>(
        name: 'Email',
        valueGetter: (item) => item['email'].toString(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Data Table from API with Pagination')),
      body: DataTableWidget<Map<String, dynamic>>(
        headers: headers,
        controller: controller,
      ),
    );
  }
}

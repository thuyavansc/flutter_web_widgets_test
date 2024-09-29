
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/datatable_provider.dart';
import 'package:data_table_2/data_table_2.dart';

import 'model/user.dart';



// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Custom Paginated Data Table')),
//       body: ChangeNotifierProvider<DataProvider>(
//         create: (_) => DataProvider()..fetchData(),
//         child: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return PagedDataTable<String, Map<String, dynamic>>(
//               fetcher: (pageSize, _, __, pageToken) async {
//                 await provider.fetchData(isNextPage: pageToken != null);
//                 return (provider.data, null); // Return data and next page token
//               },
//               columns: _buildTableColumns(),
//               configuration: PagedDataTableConfiguration(
//                 pageSize: 10,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   List<TableColumn<String, Map<String, dynamic>>> _buildTableColumns() {
//     return [
//       TableColumn(
//         title: Text(headers[0]),
//         cellBuilder: (context, item, index) {
//           return Text(item['id'].toString());
//         },
//       ),
//       TableColumn(
//         title: Text(headers[1]),
//         cellBuilder: (context, item, index) {
//           return Text(item['name']);
//         },
//       ),
//       TableColumn(
//         title: Text(headers[2]),
//         cellBuilder: (context, item, index) {
//           return ElevatedButton(
//             onPressed: () {
//               print('Editing item ${item['id']}');
//             },
//             child: Text('Edit'),
//           );
//         },
//       ),
//     ];
//   }
// }





// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Custom Paginated Data Table')),
//       body: ChangeNotifierProvider<DataProvider>(
//         create: (_) => DataProvider()..fetchData(),
//         child: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return PagedDataTable<String, Map<String, dynamic>>(
//               fetcher: (int pageSize, SortModel? sortModel, FilterModel? filterModel, String? pageToken) async {
//                 await provider.fetchData(isNextPage: pageToken != null);
//                 return (provider.data, null); // Returning data and next page token
//               },
//               columns: _buildTableColumns(),
//               configuration: const PagedDataTableConfiguration(
//                 copyItems: true,  // To ensure data is copied and modifications don't affect the original list
//               ),
//               footer: const SizedBox.shrink(), // Optional custom footer
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   List<TableColumn<String, Map<String, dynamic>>> _buildTableColumns() {
//     return [
//       TableColumn(
//         title: Text(headers[0]),
//         cellBuilder: (context, item, index) {
//           return Text(item['id'].toString());
//         },
//       ),
//       TableColumn(
//         title: Text(headers[1]),
//         cellBuilder: (context, item, index) {
//           return Text(item['name']);
//         },
//       ),
//       TableColumn(
//         title: Text(headers[2]),
//         cellBuilder: (context, item, index) {
//           return ElevatedButton(
//             onPressed: () {
//               print('Editing item ${item['id']}');
//             },
//             child: Text('Edit'),
//           );
//         },
//       ),
//     ];
//   }
// }



// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(),
//       child: Consumer<DataProvider>(
//         builder: (context, provider, child) {
//           return Expanded(  // Ensures the table fits within the remaining space
//             child: SingleChildScrollView(  // Makes the content scrollable
//               scrollDirection: Axis.vertical, // Optional: Adjusts for vertical scrolling
//               child: PagedDataTable<String, Map<String, dynamic>>(
//                 fetcher: (int pageSize, SortModel? sortModel, FilterModel? filterModel, String? pageToken) async {
//                   await provider.fetchData(isNextPage: pageToken != null);
//                   return (provider.data, null); // Returning data and next page token
//                 },
//                 columns: _buildTableColumns(),
//                 configuration: const PagedDataTableConfiguration(
//                   copyItems: true,  // To ensure data is copied and modifications don't affect the original list
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   List<TableColumn<String, Map<String, dynamic>>> _buildTableColumns() {
//     return [
//       TableColumn(
//         title: Text(headers[0]),
//         cellBuilder: (context, item, index) {
//           return Text(item['id'].toString());
//         },
//       ),
//       TableColumn(
//         title: Text(headers[1]),
//         cellBuilder: (context, item, index) {
//           return Text(item['name']);
//         },
//       ),
//       TableColumn(
//         title: Text(headers[2]),
//         cellBuilder: (context, item, index) {
//           return ElevatedButton(
//             onPressed: () {
//               print('Editing item ${item['id']}');
//             },
//             child: Text('Edit'),
//           );
//         },
//       ),
//     ];
//   }
// }




// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 10),
//       child: Consumer<DataProvider>(
//         builder: (context, provider, child) {
//           return Scaffold(
//             body: Column(
//               children: [
//                 Expanded(
//                   child: PagedDataTable<String, Map<String, dynamic>>(
//                     fetcher: (int pageSize, SortModel? sortModel, FilterModel? filterModel, String? pageToken) async {
//                       await provider.fetchData(page: provider.currentPage, pageSize: pageSize);
//                       return (provider.pagedData, null); // Returning paged data and null for token
//                     },
//                     columns: _buildTableColumns(),
//                     configuration: const PagedDataTableConfiguration(
//                       copyItems: true,
//                     ),
//                     initialPageSize: 10,
//                   ),
//                 ),
//                 _buildPaginationControls(provider),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   List<TableColumn<String, Map<String, dynamic>>> _buildTableColumns() {
//     return [
//       TableColumn(
//         title: Text(headers[0]),
//         cellBuilder: (context, item, index) {
//           return Text(item['id'].toString());
//         },
//       ),
//       TableColumn(
//         title: Text(headers[1]),
//         cellBuilder: (context, item, index) {
//           return Text(item['name']);
//         },
//       ),
//       TableColumn(
//         title: Text(headers[2]),
//         cellBuilder: (context, item, index) {
//           return ElevatedButton(
//             onPressed: () {
//               print('Editing item ${item['id']}');
//             },
//             child: Text('Edit'),
//           );
//         },
//       ),
//     ];
//   }
//
//   // Pagination controls (Next and Previous)
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//     TextButton(
//     onPressed: provider.currentPage > 0
//         ? () async {
//       await provider.fetchPreviousPage();
//     }
//         : null,
//     child: Text('Previous'),
//     ),
//     TextButton(
//     onPressed: () async {
//     await provider.fetchNextPage();
//     },
//     child: Text('Next')
//     ),
//     ],
//     );
//   }
// }


//New package-working
// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 10),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Paginated DataTable2 Example')),
//         body: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: DataTable2(
//                     columns: _buildTableColumns(),
//                     rows: _buildTableRows(provider.pagedData),
//                     headingRowColor:
//                     MaterialStateProperty.resolveWith((states) => Colors.grey[200]),
//                     columnSpacing: 12,
//                     horizontalMargin: 12,
//                     minWidth: 600,
//                     dataTextStyle: TextStyle(fontSize: 14),
//                   ),
//                 ),
//                 _buildPaginationControls(provider),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build columns of the DataTable2
//   List<DataColumn> _buildTableColumns() {
//     return [
//       DataColumn(label: Text(headers[0])),
//       DataColumn(label: Text(headers[1])),
//       DataColumn(label: Text(headers[2])),
//     ];
//   }
//
//   // Build rows of the DataTable2
//   List<DataRow> _buildTableRows(List<Map<String, dynamic>> data) {
//     return data.map((item) {
//       return DataRow(cells: [
//         DataCell(Text(item['id'].toString())),
//         DataCell(Text(item['name'])),
//         DataCell(ElevatedButton(
//           onPressed: () {
//             print('Editing item ${item['id']}');
//           },
//           child: Text('Edit'),
//         )),
//       ]);
//     }).toList();
//   }
//
//   // Build pagination controls with left and right arrows
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
//           icon: Icon(Icons.arrow_left),
//         ),
//         Text('Page ${provider.currentPage + 1}'),
//         IconButton(
//           onPressed: provider.pagedData.length == 10 ? provider.fetchNextPage : null,
//           icon: Icon(Icons.arrow_right),
//         ),
//       ],
//     );
//   }
// }



// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 5), // Default to 5 rows per page
//       child: Scaffold(
//         appBar: AppBar(title: Text('Paginated DataTable2 Example')),
//         body: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: DataTable2(
//                     columns: _buildTableColumns(),
//                     rows: _buildTableRows(provider.pagedData),
//                     columnSpacing: 12,
//                     horizontalMargin: 12,
//                     minWidth: 600,
//                   ),
//                 ),
//                 _buildPaginationControls(provider),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build columns of the DataTable2
//   List<DataColumn> _buildTableColumns() {
//     return [
//       DataColumn(label: Text(headers[0])),
//       DataColumn(label: Text(headers[1])),
//       DataColumn(label: Text(headers[2])),
//     ];
//   }
//
//   // Build rows of the DataTable2
//   List<DataRow> _buildTableRows(List<Map<String, dynamic>> data) {
//     return data.map((item) {
//       return DataRow(cells: [
//         DataCell(Text(item['id'].toString())),
//         DataCell(Text(item['name'])),
//         DataCell(ElevatedButton(
//           onPressed: () {
//             print('Editing item ${item['id']}');
//           },
//           child: Text('Edit'),
//         )),
//       ]);
//     }).toList();
//   }
//
//   // Build pagination controls with rows per page dropdown and left/right arrows
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Rows per page dropdown
//           Row(
//             children: [
//               Text('Rows per page:'),
//               SizedBox(width: 10),
//               DropdownButton<int>(
//                 value: provider.pageSize,
//                 items: [5, 10, 20, 50].map((int value) {
//                   return DropdownMenuItem<int>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     provider.changePageSize(value);
//                   }
//                 },
//               ),
//             ],
//           ),
//
//           // Pagination controls (left and right arrows)
//           Row(
//             children: [
//               Text(
//                 '${provider.currentPage * provider.pageSize + 1} - '
//                     '${(provider.currentPage + 1) * provider.pageSize > provider.allData.length ? provider.allData.length : (provider.currentPage + 1) * provider.pageSize}'
//                     ' of ${provider.allData.length}',
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: (provider.currentPage + 1) * provider.pageSize < provider.allData.length
//                     ? provider.fetchNextPage
//                     : null,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 5), // Default to 5 rows per page
//       child: Scaffold(
//         //appBar: AppBar(title: Text('Paginated DataTable2 Example')),
//         body: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildPaginationControls(provider),
//                 Expanded(
//                   child: DataTable2(
//                     columns: _buildTableColumns(),
//                     rows: _buildTableRows(provider.pagedData),
//                     columnSpacing: 12,
//                     horizontalMargin: 12,
//                     minWidth: 600,
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build columns of the DataTable2
//   List<DataColumn> _buildTableColumns() {
//     return [
//       DataColumn(label: Text(headers[0])),
//       DataColumn(label: Text(headers[1])),
//       DataColumn(label: Text(headers[2])),
//     ];
//   }
//
//   // Build rows of the DataTable2
//   List<DataRow> _buildTableRows(List<Map<String, dynamic>> data) {
//     return data.map((item) {
//       return DataRow(cells: [
//         DataCell(Text(item['id'].toString())),
//         DataCell(Text(item['name'])),
//         DataCell(ElevatedButton(
//           onPressed: () {
//             print('Editing item ${item['id']}');
//           },
//           child: Text('Edit'),
//         )),
//       ]);
//     }).toList();
//   }
//
//   // Build pagination controls with rows per page dropdown and left/right arrows
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // Rows per page dropdown
//           Row(
//             children: [
//               Text('Rows per page:'),
//               SizedBox(width: 10),
//               DropdownButton<int>(
//                 value: provider.pageSize,
//                 underline: SizedBox.shrink(),  // Remove underline or grey highlight
//                 items: [5, 10, 20, 50].map((int value) {
//                   return DropdownMenuItem<int>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     provider.changePageSize(value);
//                   }
//                 },
//               ),
//             ],
//           ),
//
//           // Pagination controls (left and right arrows)
//           Row(
//             children: [
//               Text(
//                 '${provider.currentPage * provider.pageSize + 1} - '
//                     '${(provider.currentPage + 1) * provider.pageSize > provider.allData.length ? provider.allData.length : (provider.currentPage + 1) * provider.pageSize}'
//                     ' of ${provider.allData.length}',
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: (provider.currentPage + 1) * provider.pageSize < provider.allData.length
//                     ? provider.fetchNextPage
//                     : null,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




//selection
// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = ['ID', 'Name', 'Action'];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 5),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Paginated DataTable2 Example')),
//         body: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildPaginationControls(provider),
//                 Expanded(
//                   child: DataTable2(
//                     columns: _buildTableColumns(),
//                     rows: _buildTableRows(provider.pagedData, provider),
//                     columnSpacing: 12,
//                     horizontalMargin: 12,
//                     minWidth: 600,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build columns of the DataTable2
//   List<DataColumn> _buildTableColumns() {
//     return [
//       DataColumn(label: Text('ID')),
//       DataColumn(label: Text('Name')),
//       DataColumn(label: Text('Action')),
//     ];
//   }
//
//   // Build rows of the DataTable2 with selection capability
//   List<DataRow> _buildTableRows(List<Map<String, dynamic>> data, DataProvider provider) {
//     return data.map((item) {
//       return DataRow(
//         selected: provider.selectedRowIds.contains(item['id']),
//         onSelectChanged: (isSelected) {
//           provider.toggleRowSelection(item['id']);
//         },
//         cells: [
//           DataCell(Text(item['id'].toString())),
//           DataCell(Text(item['name'])),
//           DataCell(ElevatedButton(
//             onPressed: () {
//               print('Editing item ${item['id']}');
//             },
//             child: Text('Edit'),
//           )),
//         ],
//       );
//     }).toList();
//   }
//
//   // Build pagination controls with rows per page dropdown and left/right arrows
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // Rows per page dropdown
//           Row(
//             children: [
//               Text('Rows per page:'),
//               SizedBox(width: 10),
//               DropdownButton<int>(
//                 value: provider.pageSize,
//                 underline: SizedBox.shrink(),  // Remove underline or grey highlight
//                 items: [5, 10, 20, 50].map((int value) {
//                   return DropdownMenuItem<int>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     provider.changePageSize(value);
//                   }
//                 },
//               ),
//             ],
//           ),
//
//           // Pagination controls (left and right arrows)
//           Row(
//             children: [
//               Text(
//                 '${provider.currentPage * provider.pageSize + 1} - '
//                     '${(provider.currentPage + 1) * provider.pageSize > provider.allData.length ? provider.allData.length : (provider.currentPage + 1) * provider.pageSize}'
//                     ' of ${provider.allData.length}',
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: (provider.currentPage + 1) * provider.pageSize < provider.allData.length
//                     ? provider.fetchNextPage
//                     : null,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }





//Working Code
// class PaginatedDataTableExample extends StatelessWidget {
//   final List<String> headers = [
//     'Device Name',
//     'Manufacturer',
//     'Model',
//     'OS Version',
//     'Battery Percentage',
//     'Available Memory',
//     'Phone Number',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<DataProvider>(
//       create: (_) => DataProvider()..fetchData(page: 0, pageSize: 5),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Paginated DataTable Example')),
//         body: Consumer<DataProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildPaginationControls(provider),
//                 Expanded(
//                   child: DataTable2(
//                     columns: _buildTableColumns(context),
//                     rows: _buildTableRows(provider.pagedData, provider),
//                     columnSpacing: 12,
//                     horizontalMargin: 12,
//                     minWidth: 600,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Build columns of the DataTable
//   List<DataColumn> _buildTableColumns(BuildContext context) {
//     return headers.map((header) {
//       return DataColumn(
//         label: Container(
//           padding: EdgeInsets.all(8),
//           child: Text(
//             header.toUpperCase(),
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
//           ),
//         ),
//       );
//     }).toList();
//   }
//
//   // Build rows of the DataTable with selection capability
//   List<DataRow> _buildTableRows(List<Map<String, dynamic>> data, DataProvider provider) {
//     return data.map((item) {
//       return DataRow(
//         selected: provider.selectedRowIds.contains(item['id']),
//         onSelectChanged: (isSelected) {
//           if (isSelected != null) {
//             provider.toggleRowSelection(item['id']);
//           }
//         },
//         cells: [
//           DataCell(
//             Row(
//               children: [
//                 _buildDeviceImage(item['image']),
//                 SizedBox(width: 8),
//                 GestureDetector(
//                   onTap: () {
//                     print('Device Name tapped: ${item['deviceName']}');
//                   },
//                   child: Text(
//                     item['deviceName'],
//                     style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           DataCell(Text(item['manufacturer'])),
//           DataCell(Text(item['model'])),
//           DataCell(Text(item['osVersion'])),
//           DataCell(
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 LinearProgressIndicator(
//                   value: item['batteryPercentage'] / 100,
//                   minHeight: 5,
//                 ),
//                 SizedBox(height: 4),
//                 Text('${item['batteryPercentage']}%'),
//               ],
//             ),
//           ),
//           DataCell(
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 LinearProgressIndicator(
//                   value: item['availableMemoryPercentage'] / 100,
//                   minHeight: 5,
//                 ),
//                 SizedBox(height: 4),
//                 Text('${item['availableMemory']}/8GB'), // Assuming max is 8GB
//               ],
//             ),
//           ),
//           DataCell(Text(item['phoneNumber'])),
//         ],
//       );
//     }).toList();
//   }
//
//   // Update this function to handle network image loading with error fallback
//   Widget _buildDeviceImage(String? imageUrl) {
//     return CircleAvatar(
//       radius: 20,
//       backgroundImage: NetworkImage(imageUrl ?? ''),
//       child: Image.network(
//         imageUrl ?? '',
//         fit: BoxFit.cover,
//         errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
//           // Return default mobile icon if the image fails to load
//           return Image.asset(
//             'mobile_icon.png', // Replace with your mobile icon asset
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
//
//   // Build pagination controls with rows per page dropdown and left/right arrows
//   Widget _buildPaginationControls(DataProvider provider) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // Rows per page dropdown
//           Row(
//             children: [
//               Text('Rows per page:'),
//               SizedBox(width: 10),
//               DropdownButton<int>(
//                 value: provider.pageSize,
//                 underline: SizedBox.shrink(), // Remove underline or grey highlight
//                 items: [5, 10, 20, 50].map((int value) {
//                   return DropdownMenuItem<int>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     provider.changePageSize(value);
//                   }
//                 },
//               ),
//             ],
//           ),
//
//           // Pagination controls (left and right arrows)
//           Row(
//             children: [
//               Text(
//                 '${provider.currentPage * provider.pageSize + 1} - '
//                     '${(provider.currentPage + 1) * provider.pageSize > provider.allData.length ? provider.allData.length : (provider.currentPage + 1) * provider.pageSize}'
//                     ' of ${provider.allData.length}',
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: (provider.currentPage + 1) * provider.pageSize < provider.allData.length
//                     ? provider.fetchNextPage
//                     : null,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




class PaginatedDataTableExample extends StatelessWidget {
  final List<String> headers = [
    'IMG',
    'Device Name',
    'Manufacturer',
    'Model',
    'OS Version',
    'Battery Percentage',
    'Available Memory',
    'Phone Number',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (_) => DataProvider()..fetchData(page: 0, pageSize: 5),
      child: Scaffold(
        appBar: AppBar(title: Text('Paginated DataTable Example')),
        body: Consumer<DataProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPaginationControls(provider),
                Expanded(
                  child: DataTable2(
                    columns: _buildTableColumns(context),
                    rows: _buildTableRows(provider.pagedData, provider),
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 1200,
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  // Build columns of the DataTable
  List<DataColumn> _buildTableColumns(BuildContext context) {
    return headers.map((header) {
      return DataColumn(
        label: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            header.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  // Build rows of the DataTable with selection capability
  List<DataRow> _buildTableRows(List<Map<String, dynamic>> data, DataProvider provider) {
    return data.map((item) {
      return DataRow(
        selected: provider.selectedRowIds.contains(item['id']),
        onSelectChanged: (isSelected) {
          if (isSelected != null) {
            provider.toggleRowSelection(item['id']);
          }
        },
        cells: [
          DataCell(
            _buildDeviceImage(item['image']),
          ),
          DataCell(
            GestureDetector(
              onTap: () {
                print('Device Name tapped: ${item['deviceName']}');
              },
              child: Text(
                item['deviceName'],
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          DataCell(Text(item['manufacturer'])),
          DataCell(Text(item['model'])),
          DataCell(Text(item['osVersion'])),
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: item['batteryPercentage'] / 100,
                  minHeight: 5,
                ),
                SizedBox(height: 2),
                Text('${item['batteryPercentage']}%'),
              ],
            ),
          ),
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: item['availableMemoryPercentage'] / 100,
                  minHeight: 5,
                ),
                SizedBox(height: 2),
                Text('${item['availableMemory']}/8GB'), // Assuming max is 8GB
              ],
            ),
          ),
          DataCell(Text(item['phoneNumber'])),
        ],
      );
    }).toList();
  }

  // Update this function to handle network image loading with error fallback
  Widget _buildDeviceImage0(String? imageUrl) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(imageUrl ?? ''),
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          // Return default mobile icon if the image fails to load
          return Image.asset(
            'mobile_icon.png', // Replace with your mobile icon asset
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildDeviceImage(String? imageUrl) {
    return Container(
      width: 40, // Set a fixed width
      height: 40, // Set a fixed height
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child; // Return the image once loaded

          return Center(
            child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null),
          );
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          // Return default mobile icon if the image fails to load
          return Image.asset(
            'assets/mobile_icon.png', // Replace with your mobile icon asset
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }


  // Build pagination controls with rows per page dropdown and left/right arrows
  Widget _buildPaginationControls(DataProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Rows per page dropdown
          Row(
            children: [
              Text('Rows per page:'),
              SizedBox(width: 10),
              DropdownButton<int>(
                value: provider.pageSize,
                underline: SizedBox.shrink(), // Remove underline or grey highlight
                items: [5, 10, 20, 50].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    provider.changePageSize(value);
                  }
                },
              ),
            ],
          ),

          // Pagination controls (left and right arrows)
          Row(
            children: [
              Text(
                '${provider.currentPage * provider.pageSize + 1} - '
                    '${(provider.currentPage + 1) * provider.pageSize > provider.allData.length ? provider.allData.length : (provider.currentPage + 1) * provider.pageSize}'
                    ' of ${provider.allData.length}',
              ),
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: provider.currentPage > 0 ? provider.fetchPreviousPage : null,
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: (provider.currentPage + 1) * provider.pageSize < provider.allData.length
                    ? provider.fetchNextPage
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

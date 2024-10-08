
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class StorageTypeDataTable extends StatefulWidget {
//   @override
//   _StorageTypeDataTableState createState() => _StorageTypeDataTableState();
// }
//
// class _StorageTypeDataTableState extends State<StorageTypeDataTable> {
//   int _currentPage = 1;
//   int _totalPages = 1;
//   List<Map<String, String>> _data = [
//     {'ABBREVIATION': 'Abb01', 'NAME': 'S002', 'DESCRIPTION': 'Des'},
//     {'ABBREVIATION': 'Abb', 'NAME': 'ST001', 'DESCRIPTION': 'Description'},
//     {'ABBREVIATION': 'NewTest', 'NAME': 'NewTest12345 NewTest12345', 'DESCRIPTION': 'NewTest'},
//     {'ABBREVIATION': 'Test', 'NAME': 'test3', 'DESCRIPTION': 'sample test 2'},
//     {'ABBREVIATION': 'DEF', 'NAME': 'test', 'DESCRIPTION': 'sample'},
//     {'ABBREVIATION': 'string', 'NAME': 'string', 'DESCRIPTION': 'string'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Storage Type Data Table'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.grey),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text('Add New StorageType'),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black, backgroundColor: Colors.blue[50],
//               ),
//             ),
//             SizedBox(height: 16),
//             TabBarWidget(),
//             SizedBox(height: 16),
//             Expanded(
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   return ScrollConfiguration(
//                     behavior: ScrollBehavior().copyWith(overscroll: false),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minWidth: constraints.maxWidth,
//                         ),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: DataTable(
//                             columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                             columns: [
//                               DataColumn(label: Text('ABBREVIATION', style: TextStyle(fontWeight: FontWeight.bold))),
//                               DataColumn(label: Text('NAME', style: TextStyle(fontWeight: FontWeight.bold))),
//                               DataColumn(label: Text('DESCRIPTION', style: TextStyle(fontWeight: FontWeight.bold))),
//                               DataColumn(label: Text('ACTIONS', style: TextStyle(fontWeight: FontWeight.bold))),
//                             ],
//                             rows: _data.map((row) {
//                               return DataRow(cells: [
//                                 DataCell(Text(row['ABBREVIATION'] ?? '')),
//                                 DataCell(Text(row['NAME'] ?? '')),
//                                 DataCell(Text(row['DESCRIPTION'] ?? '')),
//                                 DataCell(Row(
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {},
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.edit, size: 16),
//                                           SizedBox(width: 4),
//                                           Text('Edit'),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 8),
//                                     TextButton(
//                                       onPressed: () {},
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.archive, size: 16, color: Colors.red),
//                                           SizedBox(width: 4),
//                                           Text('Archive', style: TextStyle(color: Colors.red)),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                               ]);
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
//                 ),
//                 Text('$_currentPage of $_totalPages'),
//                 IconButton(
//                   icon: Icon(Icons.arrow_forward_ios),
//                   onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TabBarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Column(
//         children: [
//           TabBar(
//             indicatorColor: Colors.blue,
//             tabs: [
//               Tab(text: 'Active'),
//               Tab(text: 'Archived'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




// class StorageTypeDataTable extends StatefulWidget {
//   @override
//   _StorageTypeDataTableState createState() => _StorageTypeDataTableState();
// }
//
// class _StorageTypeDataTableState extends State<StorageTypeDataTable> {
//   int _currentPage = 1;
//   int _totalPages = 1;
//   List<Map<String, String>> _data = [
//     {'ABBREVIATION': 'Abb01', 'NAME': 'S002', 'DESCRIPTION': 'Des'},
//     {'ABBREVIATION': 'Abb', 'NAME': 'ST001', 'DESCRIPTION': 'Description'},
//     {'ABBREVIATION': 'NewTest', 'NAME': 'NewTest12345', 'DESCRIPTION': 'NewTest'},
//     {'ABBREVIATION': 'Test', 'NAME': 'test3', 'DESCRIPTION': 'sample test 2'},
//     {'ABBREVIATION': 'DEF', 'NAME': 'test', 'DESCRIPTION': 'sample'},
//     {'ABBREVIATION': 'string', 'NAME': 'string', 'DESCRIPTION': 'string'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Storage Type Data Table'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.grey),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text('Add New StorageType'),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black, backgroundColor: Colors.blue[50],
//               ),
//             ),
//             SizedBox(height: 16),
//             TabBarWidget(),
//             SizedBox(height: 16),
//             Expanded(
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   return ScrollConfiguration(
//                     behavior: ScrollBehavior().copyWith(overscroll: false),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minWidth: constraints.maxWidth,
//                         ),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: SelectableText.rich(
//                             TextSpan(
//                               children: [
//                                 WidgetSpan(
//                                   child: DataTable(
//                                     columnSpacing: MediaQuery.of(context).size.width * 0.05,
//                                     columns: [
//                                       DataColumn(label: Text('ABBREVIATION', style: TextStyle(fontWeight: FontWeight.bold))),
//                                       DataColumn(label: Text('NAME', style: TextStyle(fontWeight: FontWeight.bold))),
//                                       DataColumn(label: Text('DESCRIPTION', style: TextStyle(fontWeight: FontWeight.bold))),
//                                       DataColumn(label: Text('ACTIONS', style: TextStyle(fontWeight: FontWeight.bold))),
//                                     ],
//                                     rows: _data.map((row) {
//                                       return DataRow(cells: [
//                                         DataCell(SelectableText(row['ABBREVIATION'] ?? '')),
//                                         DataCell(SelectableText(row['NAME'] ?? '')),
//                                         DataCell(SelectableText(row['DESCRIPTION'] ?? '')),
//                                         DataCell(Row(
//                                           children: [
//                                             TextButton(
//                                               onPressed: () {},
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.edit, size: 16),
//                                                   SizedBox(width: 4),
//                                                   Text('Edit'),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(width: 8),
//                                             TextButton(
//                                               onPressed: () {},
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Icons.archive, size: 16, color: Colors.red),
//                                                   SizedBox(width: 4),
//                                                   Text('Archive', style: TextStyle(color: Colors.red)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                       ]);
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
//                 ),
//                 Text('$_currentPage of $_totalPages'),
//                 IconButton(
//                   icon: Icon(Icons.arrow_forward_ios),
//                   onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TabBarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Column(
//         children: [
//           TabBar(
//             indicatorColor: Colors.blue,
//             tabs: [
//               Tab(text: 'Active'),
//               Tab(text: 'Archived'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }





// class StorageTypeDataTable extends StatefulWidget {
//   @override
//   _StorageTypeDataTableState createState() => _StorageTypeDataTableState();
// }
//
// class _StorageTypeDataTableState extends State<StorageTypeDataTable> {
//   int _currentPage = 1;
//   int _totalPages = 1;
//   List<Map<String, String>> _data = [
//     {'ABBREVIATION': 'Abb01', 'NAME': 'S002', 'DESCRIPTION': 'Des'},
//     {'ABBREVIATION': 'Abb', 'NAME': 'ST001', 'DESCRIPTION': 'Description'},
//     {'ABBREVIATION': 'NewTest', 'NAME': 'NewTest12345', 'DESCRIPTION': 'NewTest'},
//     {'ABBREVIATION': 'Test', 'NAME': 'test3', 'DESCRIPTION': 'sample test 2'},
//     {'ABBREVIATION': 'DEF', 'NAME': 'test', 'DESCRIPTION': 'sample'},
//     {'ABBREVIATION': 'string', 'NAME': 'string', 'DESCRIPTION': 'string'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Storage Type Data Table'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.grey),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text('Add New StorageType'),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black, backgroundColor: Colors.blue[50],
//               ),
//             ),
//             SizedBox(height: 16),
//             TabBarWidget(),
//             SizedBox(height: 16),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                   ),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: SelectableText(
//                       _buildTableText(),
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
//                 ),
//                 Text('$_currentPage of $_totalPages'),
//                 IconButton(
//                   icon: Icon(Icons.arrow_forward_ios),
//                   onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _buildTableText() {
//     String tableText = 'ABBREVIATION\tNAME\tDESCRIPTION\n';
//     for (var row in _data) {
//       tableText += '${row['ABBREVIATION']}\t${row['NAME']}\t${row['DESCRIPTION']}\n';
//     }
//     return tableText;
//   }
// }
//
// class TabBarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Column(
//         children: [
//           TabBar(
//             indicatorColor: Colors.blue,
//             tabs: [
//               Tab(text: 'Active'),
//               Tab(text: 'Archived'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



class ReusableDataTable extends StatelessWidget {
  final List<String> headers;
  final List<Map<String, String>> data;
  final List<DataColumn> Function(List<String> headers)? buildColumns;
  final List<DataRow> Function(List<Map<String, String>> data)? buildRows;

  ReusableDataTable({
    required this.headers,
    required this.data,
    this.buildColumns,
    this.buildRows,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: MediaQuery.of(context).size.width * 0.05,
                  columns: buildColumns != null
                      ? buildColumns!(headers)
                      : headers
                      .map((header) => DataColumn(
                    label: Text(header, style: TextStyle(fontWeight: FontWeight.bold)),
                  ))
                      .toList(),
                  rows: buildRows != null
                      ? buildRows!(data)
                      : data.map((row) {
                    return DataRow(
                      cells: headers.map((header) {
                        return DataCell(Text(row[header] ?? ''));
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StorageTypeDataTable extends StatefulWidget {
  @override
  _StorageTypeDataTableState createState() => _StorageTypeDataTableState();
}

class _StorageTypeDataTableState extends State<StorageTypeDataTable> {
  int _currentPage = 1;
  int _totalPages = 1;
  List<String> _headers = ['ABBREVIATION-ABBREVIATION-ABBREVIATION-ABBREVIATION-ABBREVIATION', 'NAME', 'DESCRIPTION', 'ACTIONS'];
  List<Map<String, String>> _data = [
    {'ABBREVIATION': 'Abb01', 'NAME': 'S002', 'DESCRIPTION': 'Des'},
    {'ABBREVIATION': 'Abb', 'NAME': 'ST001', 'DESCRIPTION': 'Description'},
    {'ABBREVIATION': 'NewTest', 'NAME': 'NewTest12345 NewTest12345', 'DESCRIPTION': 'NewTest'},
    {'ABBREVIATION': 'Test', 'NAME': 'test3', 'DESCRIPTION': 'sample test 2'},
    {'ABBREVIATION': 'DEF', 'NAME': 'test', 'DESCRIPTION': 'sample'},
    {'ABBREVIATION': 'string', 'NAME': 'string', 'DESCRIPTION': 'string'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Type Data Table'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add New StorageType'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue[50],
              ),
            ),
            SizedBox(height: 16),
            TabBarWidget(),
            SizedBox(height: 16),
            Expanded(
              child: ReusableDataTable(
                headers: _headers,
                data: _data,
                buildRows: (data) {
                  return data.map((row) {
                    return DataRow(cells: [
                      DataCell(Text(row['ABBREVIATION'] ?? '')),
                      DataCell(Text(row['NAME'] ?? '')),
                      DataCell(Text(row['DESCRIPTION'] ?? '')),
                      DataCell(Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 16),
                                SizedBox(width: 4),
                                Text('Edit'),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.archive, size: 16, color: Colors.red),
                                SizedBox(width: 4),
                                Text('Archive', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ]);
                  }).toList();
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                ),
                Text('$_currentPage of $_totalPages'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Archived'),
            ],
          ),
        ],
      ),
    );
  }
}

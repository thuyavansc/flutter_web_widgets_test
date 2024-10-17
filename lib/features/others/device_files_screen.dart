
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// class DeviceFilesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('Device Files')),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: FutureBuilder(
//               future: provider.fetchRootDeviceFiles(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return DeviceFilesTreeView();
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: FileDetailsSection(),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => provider.saveFiles(),
//         child: Icon(Icons.save),
//       ),
//     );
//   }
// }
//
// class DeviceFilesTreeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     return ListView.builder(
//       itemCount: provider.deviceFiles.length,
//       itemBuilder: (context, index) {
//         final file = provider.deviceFiles[index];
//         return ExpansionTile(
//           title: Text(file.name),
//           children: file.subFiles.map((subFile) {
//             return ListTile(
//               title: Text(subFile.name),
//               onTap: () => provider.selectFile(subFile),
//             );
//           }).toList(),
//           onExpansionChanged: (expanded) {
//             if (expanded) provider.fetchSubDeviceFiles(file);
//           },
//         );
//       },
//     );
//   }
// }
//
// class FileDetailsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     final selectedFile = provider.selectedFile;
//     return selectedFile == null
//         ? Center(child: Text('Select a file to see details'))
//         : Column(
//       children: [
//         Text('Details for: ${selectedFile.name}'),
//         SizedBox(height: 20),
//         DropdownButton<String>(
//           value: provider.selectedAction,
//           items: [
//             DropdownMenuItem(
//               value: 'No Action',
//               child: Text('No Action'),
//             ),
//             DropdownMenuItem(
//               value: 'Upload',
//               child: Text('Upload'),
//             ),
//           ],
//           onChanged: (value) => provider.setSelectedAction(value!),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () => provider.uploadFile(),
//           child: Text('Select File to Upload'),
//         ),
//       ],
//     );
//   }
// }
//
// class DeviceFileProvider extends ChangeNotifier {
//   List<DeviceFile> _deviceFiles = [];
//   List<DeviceFile> get deviceFiles => _deviceFiles;
//
//   DeviceFile? _selectedFile;
//   DeviceFile? get selectedFile => _selectedFile;
//
//   String _selectedAction = 'No Action';
//   String get selectedAction => _selectedAction;
//
//   Future<void> fetchRootDeviceFiles() async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetRootDeviceFiles?deviceId=37';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _deviceFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<void> fetchSubDeviceFiles(DeviceFile file) async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetSubDeviceFileByDeviceFile?deviceId=37&deviceFileId=${file.id}';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         file.subFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   void selectFile(DeviceFile file) {
//     _selectedFile = file;
//     notifyListeners();
//   }
//
//   void setSelectedAction(String action) {
//     _selectedAction = action;
//     notifyListeners();
//   }
//
//   void uploadFile() {
//     // Handle the file selection and upload here
//   }
//
//   void saveFiles() {
//     // Handle saving the dropped files
//   }
// }
//
// class DeviceFile {
//   final int id;
//   final String name;
//   List<DeviceFile> subFiles;
//
//   DeviceFile({required this.id, required this.name, this.subFiles = const []});
//
//   factory DeviceFile.fromJson(Map<String, dynamic> json) {
//     return DeviceFile(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Main DeviceFilesScreen widget
// class DeviceFilesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DeviceFileProvider(),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Device Files')),
//         body: Consumer<DeviceFileProvider>(
//           builder: (context, provider, child) {
//             return Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: FutureBuilder(
//                     future: provider.fetchRootDeviceFiles(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       } else {
//                         return DeviceFilesTreeView();
//                       }
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: FileDetailsSection(),
//                 ),
//               ],
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => context.read<DeviceFileProvider>().saveFiles(),
//           child: Icon(Icons.save),
//         ),
//       ),
//     );
//   }
// }
//
// // DeviceFilesTreeView widget to display the file structure
// class DeviceFilesTreeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context, listen: false);
//     return ListView.builder(
//       itemCount: provider.deviceFiles.length,
//       itemBuilder: (context, index) {
//         final file = provider.deviceFiles[index];
//         return ExpansionTile(
//           title: Text(file.name),
//           children: file.subFiles.map((subFile) {
//             return ListTile(
//               title: Text(subFile.name),
//               onTap: () => provider.selectFile(subFile),
//             );
//           }).toList(),
//           onExpansionChanged: (expanded) {
//             if (expanded && file.subFiles.isEmpty) {
//               provider.fetchSubDeviceFiles(file);
//             }
//           },
//         );
//       },
//     );
//   }
// }
//
// // FileDetailsSection widget to display details of the selected file
// class FileDetailsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     final selectedFile = provider.selectedFile;
//
//     return selectedFile == null
//         ? Center(child: Text('Select a file to see details'))
//         : Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Details for: ${selectedFile.name}'),
//         SizedBox(height: 20),
//         DropdownButton<String>(
//           value: provider.selectedAction,
//           items: [
//             DropdownMenuItem(value: 'No Action', child: Text('No Action')),
//             DropdownMenuItem(value: 'Upload', child: Text('Upload')),
//           ],
//           onChanged: (value) => provider.setSelectedAction(value!),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () => provider.uploadFile(),
//           child: Text('Select File to Upload'),
//         ),
//       ],
//     );
//   }
// }
//
// // DeviceFileProvider for managing state and API interactions
// class DeviceFileProvider extends ChangeNotifier {
//   List<DeviceFile> _deviceFiles = [];
//   List<DeviceFile> get deviceFiles => _deviceFiles;
//
//   DeviceFile? _selectedFile;
//   DeviceFile? get selectedFile => _selectedFile;
//
//   String _selectedAction = 'No Action';
//   String get selectedAction => _selectedAction;
//
//   String _token = 'your_token_here';
//
//   Future<void> fetchRootDeviceFiles() async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetRootDeviceFiles?deviceId=37';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer $_token'},
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _deviceFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load device files');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<void> fetchSubDeviceFiles(DeviceFile file) async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetSubDeviceFileByDeviceFile?deviceId=37&deviceFileId=${file.id}';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer $_token'},
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         file.subFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load sub files');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   void selectFile(DeviceFile file) {
//     _selectedFile = file;
//     notifyListeners();
//   }
//
//   void setSelectedAction(String action) {
//     _selectedAction = action;
//     notifyListeners();
//   }
//
//   void uploadFile() {
//     // Add file upload logic here
//   }
//
//   void saveFiles() {
//     // Add logic to save all selected files or actions here
//   }
// }
//
// // Model class for DeviceFile
// class DeviceFile {
//   final int id;
//   final String name;
//   List<DeviceFile> subFiles;
//
//   DeviceFile({required this.id, required this.name, this.subFiles = const []});
//
//   factory DeviceFile.fromJson(Map<String, dynamic> json) {
//     return DeviceFile(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// // Main DeviceFilesScreen widget
// class DeviceFilesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DeviceFileProvider(),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Device Files')),
//         body: Consumer<DeviceFileProvider>(
//           builder: (context, provider, child) {
//             return Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: FutureBuilder(
//                     future: provider.rootFilesFuture,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       } else {
//                         return DeviceFilesTreeView();
//                       }
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: FileDetailsSection(),
//                 ),
//               ],
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => context.read<DeviceFileProvider>().saveFiles(),
//           child: Icon(Icons.save),
//         ),
//       ),
//     );
//   }
// }
//
// // DeviceFilesTreeView widget to display the file structure
// // class DeviceFilesTreeView extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final provider = Provider.of<DeviceFileProvider>(context);
// //     return ListView.builder(
// //       itemCount: provider.deviceFiles.length,
// //       itemBuilder: (context, index) {
// //         final file = provider.deviceFiles[index];
// //         return ExpansionTile(
// //           title: Text(file.name),
// //           children: file.subFiles.map((subFile) {
// //             return ListTile(
// //               title: Text(subFile.name),
// //               onTap: () => provider.selectFile(subFile),
// //             );
// //           }).toList(),
// //           onExpansionChanged: (expanded) {
// //             if (expanded && file.subFiles.isEmpty) {
// //               provider.fetchSubDeviceFiles(file);
// //             }
// //           },
// //         );
// //       },
// //     );
// //   }
// // }
//
//
// // class DeviceFilesTreeView extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final provider = Provider.of<DeviceFileProvider>(context);
// //     return ListView.builder(
// //       itemCount: provider.deviceFiles.length,
// //       itemBuilder: (context, index) {
// //         final file = provider.deviceFiles[index];
// //         return CustomExpansionTile(file: file);
// //       },
// //     );
// //   }
// // }
// //
// // // Custom ExpansionTile for custom styling and icons
// // class CustomExpansionTile extends StatefulWidget {
// //   final DeviceFile file;
// //
// //   CustomExpansionTile({required this.file});
// //
// //   @override
// //   _CustomExpansionTileState createState() => _CustomExpansionTileState();
// // }
// //
// // class _CustomExpansionTileState extends State<CustomExpansionTile> {
// //   bool _isExpanded = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final provider = Provider.of<DeviceFileProvider>(context, listen: false);
// //
// //     return InkWell(
// //       onTap: () {
// //         setState(() {
// //           _isExpanded = !_isExpanded;
// //           if (_isExpanded && widget.file.subFiles.isEmpty) {
// //             provider.fetchSubDeviceFiles(widget.file);
// //           }
// //         });
// //       },
// //       child: Row(
// //         children: [
// //           Icon(_isExpanded ? Icons.expand_less : Icons.expand_more, size: 20),
// //           SizedBox(width: 4),
// //           Icon(_isExpanded ? Icons.folder_open : Icons.folder, size: 20),
// //           SizedBox(width: 8),
// //           Expanded(
// //             child: Text(
// //               widget.file.name,
// //               style: TextStyle(fontSize: 16),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// class DeviceFilesTreeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     return ListView.builder(
//       itemCount: provider.deviceFiles.length,
//       itemBuilder: (context, index) {
//         final file = provider.deviceFiles[index];
//         return CustomExpansionTile(file: file, level: 0);
//       },
//     );
//   }
// }
//
// class CustomExpansionTile extends StatefulWidget {
//   final DeviceFile file;
//   final int level;
//
//   CustomExpansionTile({required this.file, required this.level});
//
//   @override
//   _CustomExpansionTileState createState() => _CustomExpansionTileState();
// }
//
// class _CustomExpansionTileState extends State<CustomExpansionTile>
//     with SingleTickerProviderStateMixin {
//   bool _isExpanded = false;
//   late final AnimationController _controller;
//   late final Animation<double> _iconAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _iconAnimation = Tween<double>(begin: 0, end: 0.25).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _toggleExpansion() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//       if (_isExpanded) {
//         _controller.forward();
//         if (widget.file.subFiles.isEmpty) {
//           Provider.of<DeviceFileProvider>(context, listen: false)
//               .fetchSubDeviceFiles(widget.file);
//         }
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: _toggleExpansion,
//           child: Padding(
//             padding: EdgeInsets.only(left: widget.level * 16.0),
//             child: Row(
//               children: [
//                 RotationTransition(
//                   turns: _iconAnimation,
//                   child: Icon(Icons.chevron_right, size: 20),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(_isExpanded ? Icons.folder_open : Icons.folder, size: 20),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     widget.file.name,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (_isExpanded)
//           Padding(
//             padding: EdgeInsets.only(left: (widget.level + 1) * 16.0),
//             child: Column(
//               children: widget.file.subFiles.map((subFile) {
//                 return CustomExpansionTile(file: subFile, level: widget.level + 1);
//               }).toList(),
//             ),
//           ),
//       ],
//     );
//   }
// }
//
//
// // FileDetailsSection widget to display details of the selected file
// class FileDetailsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DeviceFileProvider>(context);
//     final selectedFile = provider.selectedFile;
//
//     return selectedFile == null
//         ? Center(child: Text('Select a file to see details'))
//         : Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Details for: ${selectedFile.name}'),
//         SizedBox(height: 20),
//         DropdownButton<String>(
//           value: provider.selectedAction,
//           items: [
//             DropdownMenuItem(value: 'No Action', child: Text('No Action')),
//             DropdownMenuItem(value: 'Upload', child: Text('Upload')),
//           ],
//           onChanged: (value) => provider.setSelectedAction(value!),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () => provider.uploadFile(),
//           child: Text('Select File to Upload'),
//         ),
//       ],
//     );
//   }
// }
//
// // DeviceFileProvider for managing state and API interactions
// class DeviceFileProvider extends ChangeNotifier {
//   List<DeviceFile> _deviceFiles = [];
//   List<DeviceFile> get deviceFiles => _deviceFiles;
//
//   DeviceFile? _selectedFile;
//   DeviceFile? get selectedFile => _selectedFile;
//
//   String _selectedAction = 'No Action';
//   String get selectedAction => _selectedAction;
//
//   String _token = 'your_token_here';
//
//   Future<void>? _rootFilesFuture;  // Cached future
//   Future<void>? get rootFilesFuture {
//     if (_rootFilesFuture == null) {
//       _rootFilesFuture = fetchRootDeviceFiles();
//     }
//     return _rootFilesFuture;
//   }
//
//   Future<void> fetchRootDeviceFiles() async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetRootDeviceFiles?deviceId=37';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer $_token'},
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         _deviceFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load device files');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<void> fetchSubDeviceFiles(DeviceFile file) async {
//     final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetSubDeviceFileByDeviceFile?deviceId=37&deviceFileId=${file.id}';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer $_token'},
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         file.subFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load sub files');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   void selectFile(DeviceFile file) {
//     _selectedFile = file;
//     notifyListeners();
//   }
//
//   void setSelectedAction(String action) {
//     _selectedAction = action;
//     notifyListeners();
//   }
//
//   void uploadFile() {
//     // Handle the file selection and upload here
//   }
//
//   void saveFiles() {
//     // Handle saving the dropped files here
//   }
// }
//
// // Model class for DeviceFile
// class DeviceFile {
//   final int id;
//   final String name;
//   List<DeviceFile> subFiles;
//
//   DeviceFile({required this.id, required this.name, this.subFiles = const []});
//
//   factory DeviceFile.fromJson(Map<String, dynamic> json) {
//     return DeviceFile(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

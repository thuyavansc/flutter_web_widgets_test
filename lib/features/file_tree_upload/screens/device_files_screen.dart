
// lib/screens/device_files_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../providers/upload_provider.dart';
import '../widgets/device_files_tree_view.dart';
import '../widgets/file_details_section.dart';

// class DeviceFilesScreen extends StatefulWidget {
//   @override
//   _DeviceFilesScreenState createState() => _DeviceFilesScreenState();
// }
//
// class _DeviceFilesScreenState extends State<DeviceFilesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch root device files when the screen initializes
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<FileTreeProvider>(context, listen: false).fetchRootDeviceFiles();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Files'),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(48.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Consumer<FileTreeProvider>(
//               builder: (context, provider, child) {
//                 return TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search files...',
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   onChanged: (value) => provider.setSearchQuery(value),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//       body: Consumer<FileTreeProvider>(
//         builder: (context, provider, child) {
//           return Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: provider.deviceFiles.isEmpty
//                     ? Center(child: CircularProgressIndicator())
//                     : DeviceFilesTreeView(),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: FileDetailsSection(),
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<UploadProvider>().uploadFiles(),
//         child: Icon(Icons.save),
//       ),
//     );
//   }
// }



// lib/screens/device_files_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../providers/upload_provider.dart';
import '../widgets/device_files_tree_view.dart';
import '../widgets/file_details_section.dart';

// lib/screens/device_files_screen.dart

// lib/screens/device_files_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../providers/upload_provider.dart';
import '../widgets/device_files_tree_view.dart';
import '../widgets/file_details_section.dart';

// lib/screens/device_files_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../providers/upload_provider.dart';
import '../widgets/device_files_tree_view.dart';
import '../widgets/file_details_section.dart';

class DeviceFilesScreen extends StatefulWidget {
  @override
  _DeviceFilesScreenState createState() => _DeviceFilesScreenState();
}

class _DeviceFilesScreenState extends State<DeviceFilesScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch root device files when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FileTreeProvider>(context, listen: false).fetchRootDeviceFiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Files'),
      ),
      body: Consumer2<FileTreeProvider, UploadProvider>(
        builder: (context, fileProvider, uploadProvider, child) {
          // Listen to upload status changes and show Snackbars
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (uploadProvider.uploadStatus.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(uploadProvider.uploadStatus),
                  backgroundColor: uploadProvider.uploadStatus.contains('Successful')
                      ? Colors.green
                      : Colors.red,
                ),
              );
              // Clear upload status after showing
             // uploadProvider.uploadStatus = '';
            }
          });

          return Row(
            children: [
              // Left Pane: Tree View
              Expanded(
                flex: 2,
                child: fileProvider.deviceFiles.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : DeviceFilesTreeView(),
              ),
              // Right Pane: File Details and Upload
              Expanded(
                flex: 3,
                child: FileDetailsSection(),
              ),
            ],
          );
        },
      ),
    );
  }
}




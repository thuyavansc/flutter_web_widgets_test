//
// // lib/widgets/device_files_tree_view.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/file_tree_provider.dart';
// import 'custom_expansion_tile.dart';
// import '../models/device_file.dart';
//
// // lib/widgets/device_files_tree_view.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/file_tree_provider.dart';
// import 'custom_expansion_tile.dart';
// import '../models/device_file.dart';
//
// class DeviceFilesTreeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FileTreeProvider>(context);
//     return ListView.builder(
//       itemCount: provider.filteredDeviceFiles.length,
//       itemBuilder: (context, index) {
//         final file = provider.filteredDeviceFiles[index];
//         return CustomExpansionTile(file: file, level: 0);
//       },
//     );
//   }
// }
//


// lib/widgets/device_files_tree_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import 'custom_expansion_tile.dart';
import '../models/device_file.dart';

// lib/widgets/device_files_tree_view.dart

// lib/widgets/device_files_tree_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import 'custom_expansion_tile.dart';
import '../models/device_file.dart';

// lib/widgets/device_files_tree_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import 'custom_expansion_tile.dart';

class DeviceFilesTreeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FileTreeProvider>(context);
    return ListView.builder(
      itemCount: provider.filteredDeviceFiles.length,
      itemBuilder: (context, index) {
        final file = provider.filteredDeviceFiles[index];
        return CustomExpansionTile(file: file, level: 0);
      },
    );
  }
}



//
// // lib/widgets/custom_expansion_tile.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/file_tree_provider.dart';
// import '../models/device_file.dart';
//
// // lib/widgets/custom_expansion_tile.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/file_tree_provider.dart';
// import '../models/device_file.dart';
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
//   void _toggleExpansion(FileTreeProvider provider) {
//     setState(() {
//       _isExpanded = !_isExpanded;
//       if (_isExpanded) {
//         _controller.forward();
//         if (widget.file.subFiles.isEmpty && widget.file.isDirectory) {
//           provider.fetchSubDeviceFiles(widget.file);
//         }
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   void _selectFile(FileTreeProvider provider) {
//     if (!widget.file.isDirectory) {
//       provider.selectFile(widget.file);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FileTreeProvider>(context, listen: false);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () {
//             _toggleExpansion(provider);
//             _selectFile(provider);
//           },
//           child: Padding(
//             padding: EdgeInsets.only(left: widget.level * 16.0, top: 4.0, bottom: 4.0),
//             child: Row(
//               children: [
//                 RotationTransition(
//                   turns: _iconAnimation,
//                   child: Icon(Icons.chevron_right, size: 20),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(widget.file.isDirectory ? Icons.folder : Icons.insert_drive_file,
//                     size: 20,
//                     color: widget.file.isDirectory ? Colors.blue : Colors.grey),
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
//         if (_isExpanded && widget.file.isDirectory)
//           Padding(
//             padding: EdgeInsets.only(left: (widget.level + 1) * 16.0),
//             child: widget.file.subFiles.isEmpty
//                 ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircularProgressIndicator(),
//             )
//                 : Column(
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


// lib/widgets/custom_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../models/device_file.dart';

// lib/widgets/custom_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../models/device_file.dart';

// lib/widgets/custom_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../models/device_file.dart';

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
//   void _toggleExpansion(FileTreeProvider provider) {
//     setState(() {
//       _isExpanded = !_isExpanded;
//       if (_isExpanded) {
//         _controller.forward();
//         if (widget.file.subFiles.isEmpty && widget.file.isDirectory) {
//           provider.fetchSubDeviceFiles(widget.file);
//         }
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   void _selectFile(FileTreeProvider provider) {
//     provider.selectFile(widget.file); // Set selectedFile regardless of directory or file
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FileTreeProvider>(context, listen: false);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () {
//             _toggleExpansion(provider);
//             _selectFile(provider);
//           },
//           child: Padding(
//             padding: EdgeInsets.only(left: widget.level * 16.0, top: 4.0, bottom: 4.0),
//             child: Row(
//               children: [
//                 RotationTransition(
//                   turns: _iconAnimation,
//                   child: Icon(Icons.chevron_right, size: 20),
//                 ),
//                 SizedBox(width: 4),
//                 Icon(
//                   widget.file.isDirectory ? Icons.folder : _getFileIcon(widget.file.name),
//                   size: 20,
//                   color: widget.file.isDirectory ? Colors.blue : Colors.grey,
//                 ),
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
//         if (_isExpanded && widget.file.isDirectory)
//           Padding(
//             padding: EdgeInsets.only(left: (widget.level + 1) * 16.0, top: 4.0),
//             child: widget.file.subFiles.isEmpty
//                 ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'No subdirectories or files.',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             )
//                 : Column(
//               children: widget.file.subFiles.map((subFile) {
//                 return CustomExpansionTile(file: subFile, level: widget.level + 1);
//               }).toList(),
//             ),
//           ),
//       ],
//     );
//   }
//
//   IconData _getFileIcon(String fileName) {
//     String extension = fileName.split('.').last.toLowerCase();
//     switch (extension) {
//       case 'jpg':
//       case 'jpeg':
//       case 'png':
//       case 'gif':
//         return Icons.image;
//       case 'pdf':
//         return Icons.picture_as_pdf;
//       case 'doc':
//       case 'docx':
//         return Icons.description;
//       case 'xls':
//       case 'xlsx':
//         return Icons.table_chart;
//       case 'apk':
//         return Icons.android;
//       case 'json':
//         return Icons.code;
//       default:
//         return Icons.insert_drive_file;
//     }
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../models/device_file.dart';

// lib/widgets/custom_expansion_tile.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/file_tree_provider.dart';
import '../models/device_file.dart';

class CustomExpansionTile extends StatefulWidget {
  final DeviceFile file;
  final int level;

  CustomExpansionTile({required this.file, required this.level});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _controller;
  late final Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _iconAnimation = Tween<double>(begin: 0, end: 0.25).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion(FileTreeProvider provider) {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
        if (widget.file.deviceFiles.isEmpty && widget.file.isDirectory) {
          provider.fetchSubDeviceFiles(widget.file);
        }
      } else {
        _controller.reverse();
      }
    });
  }

  void _selectFile(FileTreeProvider provider) {
    provider.selectFile(widget.file); // Set selectedFile when item is tapped
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FileTreeProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            _selectFile(provider);
            if (widget.file.isDirectory) {
              _toggleExpansion(provider);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(left: widget.level * 16.0, top: 4.0, bottom: 4.0),
            child: Row(
              children: [
                if (widget.file.isDirectory)
                  RotationTransition(
                    turns: _iconAnimation,
                    child: Icon(Icons.chevron_right, size: 20),
                  )
                else
                  SizedBox(width: 20), // Placeholder for alignment
                SizedBox(width: 4),
                Icon(
                  widget.file.isDirectory ? Icons.folder : _getFileIcon(widget.file.name),
                  size: 20,
                  color: widget.file.isDirectory ? Colors.blue : Colors.grey,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.file.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded && widget.file.isDirectory)
          Padding(
            padding: EdgeInsets.only(left: (widget.level + 1) * 16.0, top: 4.0),
            child: widget.file.deviceFiles.isEmpty
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No subdirectories or files.',
                style: TextStyle(color: Colors.grey),
              ),
            )
                : Column(
              children: widget.file.deviceFiles.map((subFile) {
                return CustomExpansionTile(file: subFile, level: widget.level + 1);
              }).toList(),
            ),
          ),
      ],
    );
  }

  IconData _getFileIcon(String fileName) {
    String extension = fileName.contains('.') ? fileName.split('.').last.toLowerCase() : '';
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'apk':
        return Icons.android;
      case 'json':
        return Icons.code;
      case 'xml':
        return Icons.code;
      default:
        return Icons.insert_drive_file;
    }
  }
}



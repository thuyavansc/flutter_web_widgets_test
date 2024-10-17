
// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../models/device_file.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../providers/file_tree_provider.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:math';

// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../providers/file_tree_provider.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:math';

class FileDetailsSection extends StatefulWidget {
  @override
  _FileDetailsSectionState createState() => _FileDetailsSectionState();
}

class _FileDetailsSectionState extends State<FileDetailsSection> {
  late DropzoneViewController _controller;
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    final uploadProvider = Provider.of<UploadProvider>(context);
    final fileTreeProvider = Provider.of<FileTreeProvider>(context);
    final selectedFile = fileTreeProvider.selectedFile;

    return selectedFile == null
        ? Center(child: Text('Select a file to see details'))
        : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details for: ${selectedFile.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Icon(
            _getFileIcon(selectedFile.name),
            size: 40,
            color: Colors.blue,
          ),
          SizedBox(height: 10),
          // Text('Size: ${_formatBytes(selectedFile.size, 2)}'),
          // Add more details as needed
          SizedBox(height: 20),
          DropdownButton<String>(
            value: 'No Action', // Replace with actual value if needed
            items: [
              DropdownMenuItem(value: 'No Action', child: Text('No Action')),
              DropdownMenuItem(value: 'Upload', child: Text('Upload')),
            ],
            onChanged: (value) {
              // Implement action based on selection
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => uploadProvider.selectFiles(),
            child: Text('Select File to Upload'),
          ),
          SizedBox(height: 20),
          uploadProvider.selectedFiles.isEmpty
              ? Text('No files selected.')
              : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Files:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: uploadProvider.selectedFiles.length,
                    itemBuilder: (context, index) {
                      final file = uploadProvider.selectedFiles[index];
                      return ListTile(
                        leading: Icon(Icons.insert_drive_file),
                        title: Text(file.name),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => uploadProvider.removeSelectedFile(file),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                // Drag and Drop Area
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _highlighted ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: _highlighted ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      DropzoneView(
                        onCreated: (DropzoneViewController ctrl) => _controller = ctrl,
                        onDrop: (dynamic ev) async {
                          final bytes = await _controller.getFileData(ev);
                          final name = await _controller.getFilename(ev);
                          uploadProvider.addDroppedFile(bytes, name);
                        },
                        onHover: () {
                          setState(() {
                            _highlighted = true;
                          });
                        },
                        onLeave: () {
                          setState(() {
                            _highlighted = false;
                          });
                        },
                      ),
                      Center(
                        child: Text(
                          'Drag and drop files here to upload.',
                          style: TextStyle(
                            color: _highlighted ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                uploadProvider.isUploading
                    ? Column(
                  children: [
                    LinearProgressIndicator(),
                    SizedBox(height: 10),
                    Text(uploadProvider.uploadStatus),
                  ],
                )
                    : uploadProvider.uploadStatus.isNotEmpty
                    ? Text(
                  uploadProvider.uploadStatus,
                  style: TextStyle(
                    color: uploadProvider.uploadStatus.contains('Successful')
                        ? Colors.green
                        : Colors.red,
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getFileIcon(String fileName) {
    String extension = fileName.split('.').last.toLowerCase();
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
      default:
        return Icons.insert_drive_file;
    }
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const List<String> suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }
}


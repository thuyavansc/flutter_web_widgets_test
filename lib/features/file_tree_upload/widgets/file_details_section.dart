//
// // lib/widgets/file_details_section.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/upload_provider.dart';
// import '../models/device_file.dart';
// import 'package:flutter_dropzone/flutter_dropzone.dart';
//
// // lib/widgets/file_details_section.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/upload_provider.dart';
// import '../providers/file_tree_provider.dart';
// import 'package:flutter_dropzone/flutter_dropzone.dart';
// import 'dart:math';
//
// // lib/widgets/file_details_section.dart
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/upload_provider.dart';
// import '../providers/file_tree_provider.dart';
// import 'package:flutter_dropzone/flutter_dropzone.dart';
// import 'dart:math';
//
// class FileDetailsSection extends StatefulWidget {
//   @override
//   _FileDetailsSectionState createState() => _FileDetailsSectionState();
// }
//
// class _FileDetailsSectionState extends State<FileDetailsSection> {
//   late DropzoneViewController _controller;
//   bool _highlighted = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final uploadProvider = Provider.of<UploadProvider>(context);
//     final fileTreeProvider = Provider.of<FileTreeProvider>(context);
//     final selectedFile = fileTreeProvider.selectedFile;
//
//     return selectedFile == null
//         ? Center(child: Text('Select a file to see details'))
//         : Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Details for: ${selectedFile.name}',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Icon(
//             _getFileIcon(selectedFile.name),
//             size: 40,
//             color: Colors.blue,
//           ),
//           SizedBox(height: 10),
//           // Text('Size: ${_formatBytes(selectedFile.size, 2)}'),
//           // Add more details as needed
//           SizedBox(height: 20),
//           DropdownButton<String>(
//             value: 'No Action', // Replace with actual value if needed
//             items: [
//               DropdownMenuItem(value: 'No Action', child: Text('No Action')),
//               DropdownMenuItem(value: 'Upload', child: Text('Upload')),
//             ],
//             onChanged: (value) {
//               // Implement action based on selection
//             },
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () => uploadProvider.selectFiles(),
//             child: Text('Select File to Upload'),
//           ),
//           SizedBox(height: 20),
//           uploadProvider.selectedFiles.isEmpty
//               ? Text('No files selected.')
//               : Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Selected Files:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: uploadProvider.selectedFiles.length,
//                     itemBuilder: (context, index) {
//                       final file = uploadProvider.selectedFiles[index];
//                       return ListTile(
//                         leading: Icon(Icons.insert_drive_file),
//                         title: Text(file.name),
//                         trailing: IconButton(
//                           icon: Icon(Icons.remove_circle, color: Colors.red),
//                           onPressed: () => uploadProvider.removeSelectedFile(file),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Drag and Drop Area
//                 Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: _highlighted ? Colors.blue : Colors.grey,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                     color: _highlighted ? Colors.blue.withOpacity(0.1) : Colors.transparent,
//                   ),
//                   child: Stack(
//                     children: [
//                       DropzoneView(
//                         onCreated: (DropzoneViewController ctrl) => _controller = ctrl,
//                         onDrop: (dynamic ev) async {
//                           final bytes = await _controller.getFileData(ev);
//                           final name = await _controller.getFilename(ev);
//                           uploadProvider.addDroppedFile(bytes, name);
//                         },
//                         onHover: () {
//                           setState(() {
//                             _highlighted = true;
//                           });
//                         },
//                         onLeave: () {
//                           setState(() {
//                             _highlighted = false;
//                           });
//                         },
//                       ),
//                       Center(
//                         child: Text(
//                           'Drag and drop files here to upload.',
//                           style: TextStyle(
//                             color: _highlighted ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 uploadProvider.isUploading
//                     ? Column(
//                   children: [
//                     LinearProgressIndicator(),
//                     SizedBox(height: 10),
//                     Text(uploadProvider.uploadStatus),
//                   ],
//                 )
//                     : uploadProvider.uploadStatus.isNotEmpty
//                     ? Text(
//                   uploadProvider.uploadStatus,
//                   style: TextStyle(
//                     color: uploadProvider.uploadStatus.contains('Successful')
//                         ? Colors.green
//                         : Colors.red,
//                   ),
//                 )
//                     : Container(),
//               ],
//             ),
//           ),
//         ],
//       ),
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
//
//   String _formatBytes(int bytes, int decimals) {
//     if (bytes <= 0) return "0 B";
//     const List<String> suffixes = ["B", "KB", "MB", "GB", "TB"];
//     final i = (log(bytes) / log(1024)).floor();
//     return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
//   }
// }
//

// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../providers/file_tree_provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/device_file.dart';
import 'dart:math';

// class FileDetailsSection extends StatefulWidget {
//   @override
//   _FileDetailsSectionState createState() => _FileDetailsSectionState();
// }
//
// class _FileDetailsSectionState extends State<FileDetailsSection> {
//   List<PlatformFile> _selectedUploadFiles = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final uploadProvider = Provider.of<UploadProvider>(context);
//     final fileTreeProvider = Provider.of<FileTreeProvider>(context);
//     final selectedFile = fileTreeProvider.selectedFile;
//
//     if (selectedFile == null) {
//       return Center(child: Text('Select a directory or file to see details'));
//     }
//
//     if (selectedFile.isDirectory) {
//       return _buildDirectoryDetails(selectedFile, uploadProvider);
//     } else {
//       return _buildFileDetails(selectedFile, uploadProvider);
//     }
//   }
//
//   Widget _buildFileDetails(DeviceFile file, UploadProvider uploadProvider) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'File Details',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Divider(),
//           SizedBox(height: 10),
//           Text('File Name:', style: TextStyle(fontWeight: FontWeight.bold)),
//           TextFormField(
//             initialValue: file.name,
//             readOnly: true,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 20),
//           // Action Dropdown
//           Row(
//             children: [
//               Text('Action: ', style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(width: 10),
//               DropdownButton<String>(
//                 value: 'No Action',
//                 items: [
//                   DropdownMenuItem(value: 'No Action', child: Text('No Action')),
//                   DropdownMenuItem(value: 'Upload', child: Text('Upload')),
//                 ],
//                 onChanged: (value) {
//                   if (value == 'Upload') {
//                     // Upload the selected file
//                     uploadProvider.uploadFiles(targetDeviceFileId: file.id);
//                   }
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           // File Selection Button
//           ElevatedButton.icon(
//             onPressed: () async {
//               FilePickerResult? result = await FilePicker.platform.pickFiles(
//                 allowMultiple: true,
//               );
//
//               if (result != null) {
//                 setState(() {
//                   _selectedUploadFiles = result.files;
//                 });
//                 uploadProvider.addSelectedFiles(result.files);
//               }
//             },
//             icon: Icon(Icons.upload_file),
//             label: Text('Select File to Upload'),
//           ),
//           SizedBox(height: 20),
//           // Read-only File Name Textbox
//           if (_selectedUploadFiles.isNotEmpty)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Selected File(s):', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   height: 100,
//                   child: ListView.builder(
//                     itemCount: _selectedUploadFiles.length,
//                     itemBuilder: (context, index) {
//                       final file = _selectedUploadFiles[index];
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(child: Text(file.name)),
//                           IconButton(
//                             icon: Icon(Icons.remove_circle, color: Colors.red),
//                             onPressed: () {
//                               setState(() {
//                                 _selectedUploadFiles.removeAt(index);
//                               });
//                               uploadProvider.removeSelectedFile(file);
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           SizedBox(height: 20),
//           // Upload Button
//           ElevatedButton.icon(
//             onPressed: () {
//               // uploadProvider.uploadFiles(targetDeviceFileId: selectedFile.id);
//             },
//             icon: Icon(Icons.save),
//             label: Text('Upload Files'),
//           ),
//           SizedBox(height: 20),
//           // Upload Status
//           uploadProvider.isUploading
//               ? Column(
//             children: [
//               LinearProgressIndicator(),
//               SizedBox(height: 10),
//               Text(uploadProvider.uploadStatus),
//             ],
//           )
//               : uploadProvider.uploadStatus.isNotEmpty
//               ? Text(
//             uploadProvider.uploadStatus,
//             style: TextStyle(
//               color: uploadProvider.uploadStatus.contains('Successful')
//                   ? Colors.green
//                   : Colors.red,
//             ),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDirectoryDetails(DeviceFile directory, UploadProvider uploadProvider) {
//     // Separate files and subdirectories
//     List<DeviceFile> files = directory.subFiles.where((file) => !file.isDirectory).toList();
//     List<DeviceFile> subdirectories = directory.subFiles.where((file) => file.isDirectory).toList();
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Directory Details',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Divider(),
//           SizedBox(height: 10),
//           if (subdirectories.isNotEmpty)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Subdirectories:', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 ...subdirectories.map((subdir) => Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: Text(subdir.name, style: TextStyle(color: Colors.blue)),
//                 )),
//               ],
//             ),
//           if (subdirectories.isNotEmpty) SizedBox(height: 20),
//           if (files.isNotEmpty)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Files:', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 ...files.map((file) => Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           initialValue: file.name,
//                           readOnly: true,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       DropdownButton<String>(
//                         value: 'No Action',
//                         items: [
//                           DropdownMenuItem(value: 'No Action', child: Text('No Action')),
//                           DropdownMenuItem(value: 'Upload', child: Text('Upload')),
//                         ],
//                         onChanged: (value) {
//                           if (value == 'Upload') {
//                             uploadProvider.uploadFiles(targetDeviceFileId: directory.id);
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )),
//               ],
//             ),
//           if (files.isNotEmpty) SizedBox(height: 20),
//           // File Selection Button
//           ElevatedButton.icon(
//             onPressed: () async {
//               FilePickerResult? result = await FilePicker.platform.pickFiles(
//                 allowMultiple: true,
//               );
//
//               if (result != null) {
//                 uploadProvider.addSelectedFiles(result.files);
//               }
//             },
//             icon: Icon(Icons.upload_file),
//             label: Text('Select File to Upload'),
//           ),
//           SizedBox(height: 20),
//           // Selected Files List
//           uploadProvider.selectedFiles.isEmpty
//               ? Text('No files selected.')
//               : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Selected Files:', style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: uploadProvider.selectedFiles.length,
//                 itemBuilder: (context, index) {
//                   final file = uploadProvider.selectedFiles[index];
//                   return ListTile(
//                     leading: Icon(Icons.insert_drive_file),
//                     title: Text(file.name),
//                     trailing: IconButton(
//                       icon: Icon(Icons.remove_circle, color: Colors.red),
//                       onPressed: () => uploadProvider.removeSelectedFile(file),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           // Upload Button
//           ElevatedButton.icon(
//             onPressed: () {
//               uploadProvider.uploadFiles(targetDeviceFileId: directory.id);
//             },
//             icon: Icon(Icons.save),
//             label: Text('Upload Files'),
//           ),
//           SizedBox(height: 20),
//           // Upload Status
//           uploadProvider.isUploading
//               ? Column(
//             children: [
//               LinearProgressIndicator(),
//               SizedBox(height: 10),
//               Text(uploadProvider.uploadStatus),
//             ],
//           )
//               : uploadProvider.uploadStatus.isNotEmpty
//               ? Text(
//             uploadProvider.uploadStatus,
//             style: TextStyle(
//               color: uploadProvider.uploadStatus.contains('Successful')
//                   ? Colors.green
//                   : Colors.red,
//             ),
//           )
//               : Container(),
//         ],
//       ),
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
//
//   String _formatBytes(int bytes, int decimals) {
//     if (bytes <= 0) return "0 B";
//     const List<String> suffixes = ["B", "KB", "MB", "GB", "TB"];
//     final i = (log(bytes) / log(1024)).floor();
//     return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
//   }
// }



// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../providers/file_tree_provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/device_file.dart';

// lib/widgets/file_details_section.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/upload_provider.dart';
import '../providers/file_tree_provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/device_file.dart';

class FileDetailsSection extends StatefulWidget {
  @override
  _FileDetailsSectionState createState() => _FileDetailsSectionState();
}

class _FileDetailsSectionState extends State<FileDetailsSection> {
  PlatformFile? _selectedUploadFile;

  @override
  Widget build(BuildContext context) {
    final uploadProvider = Provider.of<UploadProvider>(context);
    final fileTreeProvider = Provider.of<FileTreeProvider>(context);
    final selectedFile = fileTreeProvider.selectedFile;

    if (selectedFile == null) {
      return Center(child: Text('Select a directory or file to see details'));
    }

    if (selectedFile.isDirectory) {
      return _buildDirectoryDetails(selectedFile, uploadProvider);
    } else {
      return _buildFileDetails(selectedFile, uploadProvider);
    }
  }

  Widget _buildFileDetails(DeviceFile file, UploadProvider uploadProvider) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'File Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(height: 10),
          Text('File Name:', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            initialValue: file.name,
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Action:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              DropdownButton<String>(
                value: 'No Action',
                items: [
                  DropdownMenuItem(value: 'No Action', child: Text('No Action')),
                  DropdownMenuItem(value: 'Upload', child: Text('Upload')),
                ],
                onChanged: (value) {
                  if (value == 'Upload') {
                    uploadProvider.selectFiles().then((_) {
                      uploadProvider.uploadFiles(targetDeviceFileId: file.deviceFileId);
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          if (uploadProvider.selectedFiles.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected File:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: uploadProvider.selectedFiles.first.name,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildDirectoryDetails(DeviceFile directory, UploadProvider uploadProvider) {
    // Separate files and subdirectories
    List<DeviceFile> files = directory.deviceFiles.where((file) => !file.isDirectory).toList();
    List<DeviceFile> subdirectories = directory.deviceFiles.where((file) => file.isDirectory).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Directory Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(height: 10),
          if (files.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: files.map((file) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: file.name,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        DropdownButton<String>(
                          value: 'No Action',
                          items: [
                            DropdownMenuItem(value: 'No Action', child: Text('No Action')),
                            DropdownMenuItem(value: 'Upload', child: Text('Upload')),
                          ],
                          onChanged: (value) {
                            if (value == 'Upload') {
                              uploadProvider.selectFiles().then((_) {
                                uploadProvider.uploadFiles(targetDeviceFileId: directory.id);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }).toList(),
            )
          else if (subdirectories.isNotEmpty)
            Text('This directory contains only subdirectories.'),
          SizedBox(height: 20),
          Text('File Name:', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            initialValue: _selectedUploadFile?.name ?? '',
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              await uploadProvider.selectFiles();
              setState(() {
                if (uploadProvider.selectedFiles.isNotEmpty) {
                  _selectedUploadFile = uploadProvider.selectedFiles.first;
                }
              });
            },
            icon: Icon(Icons.upload_file),
            label: Text('Select File to Upload'),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              if (_selectedUploadFile != null) {
                uploadProvider.uploadFiles(targetDeviceFileId: directory.id);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select a file to upload.'),
                    backgroundColor: Colors.orange,
                  ),
                );
              }
            },
            icon: Icon(Icons.save),
            label: Text('Upload File'),
          ),
          SizedBox(height: 20),
          if (uploadProvider.isUploading)
            Column(
              children: [
                LinearProgressIndicator(),
                SizedBox(height: 10),
                Text(uploadProvider.uploadStatus),
              ],
            )
          else if (uploadProvider.uploadStatus.isNotEmpty)
            Text(
              uploadProvider.uploadStatus,
              style: TextStyle(
                color: uploadProvider.uploadStatus.contains('Successful') ? Colors.green : Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}


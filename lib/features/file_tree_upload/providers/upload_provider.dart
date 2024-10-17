//
// // lib/providers/upload_provider.dart
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:typed_data';
// // lib/providers/upload_provider.dart
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:typed_data';
//
// class UploadProvider extends ChangeNotifier {
//   List<PlatformFile> _selectedFiles = [];
//   List<PlatformFile> get selectedFiles => _selectedFiles;
//
//   bool _isUploading = false;
//   bool get isUploading => _isUploading;
//
//   String _uploadStatus = '';
//   String get uploadStatus => _uploadStatus;
//
//   String _token = 'your_token_here'; // Replace with your actual token
//
//   final Dio _dio = Dio();
//
//   Future<void> selectFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//       );
//
//       if (result != null) {
//         _selectedFiles.addAll(result.files);
//         notifyListeners();
//       }
//     } catch (e) {
//       _uploadStatus = 'File selection error: $e';
//       notifyListeners();
//     }
//   }
//
//   void addDroppedFile(Uint8List bytes, String name) {
//     _selectedFiles.add(PlatformFile(
//       name: name,
//       size: bytes.length,
//       bytes: bytes,
//       path: null,
//     ));
//     notifyListeners();
//   }
//
//   void removeSelectedFile(PlatformFile file) {
//     _selectedFiles.remove(file);
//     notifyListeners();
//   }
//
//   Future<void> uploadFiles() async {
//     if (_selectedFiles.isEmpty) {
//       _uploadStatus = 'No files selected for upload.';
//       notifyListeners();
//       return;
//     }
//
//     _isUploading = true;
//     _uploadStatus = 'Uploading...';
//     notifyListeners();
//
//     try {
//       final uploadUrl = 'https://mydevices.myweb.net.au/api/DeviceFile/UploadFiles'; // Replace with your actual upload endpoint
//
//       FormData formData = FormData();
//
//       for (var file in _selectedFiles) {
//         if (file.bytes != null) {
//           formData.files.add(MapEntry(
//             'files',
//             MultipartFile.fromBytes(
//               file.bytes!,
//               filename: file.name,
//             ),
//           ));
//         } else if (file.path != null) {
//           formData.files.add(MapEntry(
//             'files',
//             await MultipartFile.fromFile(file.path!, filename: file.name),
//           ));
//         }
//       }
//
//       // Add additional fields if required
//       formData.fields.add(MapEntry('deviceId', '37'));
//
//       Response response = await _dio.post(
//         uploadUrl,
//         data: formData,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $_token',
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//         onSendProgress: (int sent, int total) {
//           double progress = (sent / total) * 100;
//           _uploadStatus = 'Uploading... ${progress.toStringAsFixed(0)}%';
//           notifyListeners();
//         },
//       );
//
//       if (response.statusCode == 200) {
//         _uploadStatus = 'Upload Successful!';
//         _selectedFiles.clear();
//       } else {
//         _uploadStatus = 'Upload Failed: ${response.statusMessage}';
//       }
//     } catch (e) {
//       _uploadStatus = 'Upload Error: $e';
//     } finally {
//       _isUploading = false;
//       notifyListeners();
//     }
//   }
//
//   void setUploadStatus(String status) {
//     _uploadStatus = status;
//     notifyListeners();
//   }
// }
//


// lib/providers/upload_provider.dart

import 'dart:typed_data';

// lib/providers/upload_provider.dart
// lib/providers/upload_provider.dart

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../services/api_service.dart';

// lib/providers/upload_provider.dart

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../services/api_service.dart';

class UploadProvider extends ChangeNotifier {
  final ApiService _apiService;

  List<PlatformFile> _selectedFiles = [];
  List<PlatformFile> get selectedFiles => _selectedFiles;

  bool _isUploading = false;
  bool get isUploading => _isUploading;

  String _uploadStatus = '';
  String get uploadStatus => _uploadStatus;

  final int deviceId = 37; // Use the correct deviceId

  UploadProvider({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<void> selectFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
      );

      if (result != null) {
        _selectedFiles = result.files;
        notifyListeners();
      }
    } catch (e) {
      _uploadStatus = 'File selection error: $e';
      notifyListeners();
    }
  }

  void clearSelectedFiles() {
    _selectedFiles.clear();
    notifyListeners();
  }

  Future<void> uploadFiles({int? targetDeviceFileId}) async {
    if (_selectedFiles.isEmpty) {
      _uploadStatus = 'No files selected for upload.';
      notifyListeners();
      return;
    }

    _isUploading = true;
    _uploadStatus = 'Uploading...';
    notifyListeners();

    try {
      List<MultipartFile> multipartFiles = [];

      for (var file in _selectedFiles) {
        if (file.bytes != null) {
          multipartFiles.add(MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
          ));
        } else if (file.path != null) {
          multipartFiles.add(await MultipartFile.fromFile(
            file.path!,
            filename: file.name,
          ));
        }
      }

      Response response = await _apiService.uploadFiles(
        deviceId: deviceId,
        files: multipartFiles,
        targetDeviceFileId: targetDeviceFileId,
      );

      if (response.statusCode == 200) {
        _uploadStatus = 'Upload Successful!';
        _selectedFiles.clear();
      } else {
        _uploadStatus = 'Upload Failed: ${response.statusMessage}';
      }
    } catch (e) {
      _uploadStatus = 'Upload Error: $e';
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}




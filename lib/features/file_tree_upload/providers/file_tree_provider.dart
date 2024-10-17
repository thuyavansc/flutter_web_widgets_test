
// lib/providers/file_tree_provider.dart

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/device_file.dart';

// lib/providers/file_tree_provider.dart

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/device_file.dart';

class FileTreeProvider extends ChangeNotifier {
  List<DeviceFile> _deviceFiles = [];
  List<DeviceFile> get deviceFiles => _deviceFiles;

  DeviceFile? _selectedFile;
  DeviceFile? get selectedFile => _selectedFile;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  String _token = 'your_token_here'; // Replace with your actual token

  final Dio _dio = Dio();

  Future<void> fetchRootDeviceFiles() async {
    final url = 'https://mydevices.myweb.net.au/api/DeviceFile/GetRootDeviceFiles?deviceId=37';
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $_token'}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _deviceFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load device files: ${response.statusMessage}');
      }
    } catch (e) {
      _deviceFiles = [];
      notifyListeners();
      throw Exception('Error fetching root device files: $e');
    }
  }

  Future<void> fetchSubDeviceFiles(DeviceFile file) async {
    if (file.subFiles.isNotEmpty) return; // Avoid redundant fetches
    final url =
        'https://mydevices.myweb.net.au/api/DeviceFile/GetSubDeviceFileByDeviceFile?deviceId=37&deviceFileId=${file.id}';
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $_token'}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        file.subFiles = data.map((e) => DeviceFile.fromJson(e)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load sub files: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching sub device files: $e');
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<DeviceFile> get filteredDeviceFiles {
    if (_searchQuery.isEmpty) {
      return _deviceFiles;
    } else {
      return _deviceFiles
          .where((file) => file.name.toLowerCase().contains(_searchQuery))
          .toList();
    }
  }

  void selectFile(DeviceFile file) {
    _selectedFile = file;
    notifyListeners();
  }
}



// lib/services/api_service.dart

// lib/services/api_service.dart

// lib/services/api_service.dart

import 'package:dio/dio.dart';
import '../models/device_file.dart';
// lib/services/api_service.dart

import 'package:dio/dio.dart';
import '../models/device_file.dart';

class ApiService {
  final Dio _dio;

  // Replace with your actual token management strategy
  final String _token = 'your_token_here';

  ApiService({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.headers["Authorization"] = "Bearer $_token";
    _dio.options.baseUrl = "https://mydevices.myweb.net.au";
  }

  Future<List<DeviceFile>> getRootDeviceFiles(int deviceId) async {
    try {
      final response = await _dio.get(
        '/api/DeviceFile/GetRootDeviceFiles',
        queryParameters: {'deviceId': deviceId},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => DeviceFile.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load root device files: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching root device files: $e');
    }
  }

  Future<List<DeviceFile>> getSubDeviceFiles(int deviceId, int deviceFileId) async {
    try {
      final response = await _dio.get(
        '/api/DeviceFile/GetSubDeviceFileByDeviceFile',
        queryParameters: {
          'deviceId': deviceId,
          'deviceFileId': deviceFileId,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => DeviceFile.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load sub device files: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching sub device files: $e');
    }
  }

  Future<Response> uploadFiles({
    required int deviceId,
    required List<MultipartFile> files,
    int? targetDeviceFileId, // Optional: Specify target directory
  }) async {
    try {
      FormData formData = FormData();
      formData.fields.add(MapEntry('deviceId', deviceId.toString()));
      if (targetDeviceFileId != null) {
        formData.fields.add(MapEntry('targetDeviceFileId', targetDeviceFileId.toString()));
      }
      formData.files.addAll(files.map((file) => MapEntry('files', file)));

      Response response = await _dio.post(
        '/api/DeviceFile/UploadFiles',
        data: formData,
        onSendProgress: (int sent, int total) {
          // Progress can be handled externally if needed
        },
      );

      return response;
    } catch (e) {
      throw Exception('Error uploading files: $e');
    }
  }
}


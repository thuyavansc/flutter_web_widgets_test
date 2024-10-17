//
// // lib/models/device_file.dart
//
// // lib/models/device_file.dart
//
// class DeviceFile {
//   final int id;
//   final String name;
//   final String path;
//   final bool isDirectory;
//   List<DeviceFile> subFiles;
//
//   DeviceFile({
//     required this.id,
//     required this.name,
//     required this.path,
//     required this.isDirectory,
//     this.subFiles = const [],
//   });
//
//   factory DeviceFile.fromJson(Map<String, dynamic> json) {
//     return DeviceFile(
//       id: json['id'],
//       name: json['name'],
//       path: json['path'],
//       isDirectory: json['isDirectory'],
//       subFiles: [],
//     );
//   }
// }



// lib/models/device_file.dart

// class DeviceFile {
//   final int id;
//   final String name;
//   final String path;
//   final bool isDirectory;
//   List<DeviceFile> subFiles;
//
//   DeviceFile({
//     required this.id,
//     required this.name,
//     required this.path,
//     required this.isDirectory,
//     this.subFiles = const [],
//   });
//
//   factory DeviceFile.fromJson(Map<String, dynamic> json) {
//     return DeviceFile(
//       id: json['id'],
//       name: json['name'],
//       path: json['path'],
//       isDirectory: json['isDirectory'],
//       subFiles: [],
//     );
//   }
// }


// lib/models/device_file.dart

class DeviceFile {
  final int id;
  final String name;
  final String path;
  final String? serverPath;
  final bool isDirectory;
  final String? action;
  final String? versionName;
  final String? packageName;
  final String? image;
  final int? deviceFileId;
  final int? mobileStatusId;
  List<DeviceFile> deviceFiles;

  DeviceFile({
    required this.id,
    required this.name,
    required this.path,
    this.serverPath,
    required this.isDirectory,
    this.action,
    this.versionName,
    this.packageName,
    this.image,
    this.deviceFileId,
    this.mobileStatusId,
    this.deviceFiles = const [],
  });

  factory DeviceFile.fromJson(Map<String, dynamic> json) {
    return DeviceFile(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      serverPath: json['serverPath'],
      isDirectory: json['isDirectory'],
      action: json['action'],
      versionName: json['versionName'],
      packageName: json['packageName'],
      image: json['image'],
      deviceFileId: json['deviceFileId'],
      mobileStatusId: json['mobileStatusId'],
      deviceFiles: json['deviceFiles'] != null
          ? (json['deviceFiles'] as List)
          .map((e) => DeviceFile.fromJson(e))
          .toList()
          : [],
    );
  }
}




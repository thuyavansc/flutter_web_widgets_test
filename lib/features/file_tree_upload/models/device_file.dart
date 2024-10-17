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

class DeviceFile {
  final int id;
  final String name;
  final String path;
  final bool isDirectory;
  List<DeviceFile> subFiles;

  DeviceFile({
    required this.id,
    required this.name,
    required this.path,
    required this.isDirectory,
    this.subFiles = const [],
  });

  factory DeviceFile.fromJson(Map<String, dynamic> json) {
    return DeviceFile(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      isDirectory: json['isDirectory'],
      subFiles: [],
    );
  }
}




class DeviceDetail {
  final DeviceInfo deviceInfo;
  final HardwareInfo hardwareInfo;
  final UserInfo userInfo;
  final ComplianceInfo complianceInfo;

  DeviceDetail({
    required this.deviceInfo,
    required this.hardwareInfo,
    required this.userInfo,
    required this.complianceInfo,
  });
}

class DeviceInfo {
  final String deviceKind;
  final String deviceId;
  final String enrollmentTime;
  final String deviceFamily;
  final String ipAddress;
  final String agentOnline;
  final String deviceMode;
  final String osVersion;
  final String path;

  DeviceInfo({
    required this.deviceKind,
    required this.deviceId,
    required this.enrollmentTime,
    required this.deviceFamily,
    required this.ipAddress,
    required this.agentOnline,
    required this.deviceMode,
    required this.osVersion,
    required this.path,
  });
}

class HardwareInfo {
  final String macAddress;
  final String wifiMacAddress;
  final String manufacturer;
  final String model;
  final String totalMemory;
  final String totalSDCardStorage;
  final String totalStorage;

  HardwareInfo({
    required this.macAddress,
    required this.wifiMacAddress,
    required this.manufacturer,
    required this.model,
    required this.totalMemory,
    required this.totalSDCardStorage,
    required this.totalStorage,
  });
}

class UserInfo {
  final String userAssigned;

  UserInfo({
    required this.userAssigned,
  });
}

class ComplianceInfo {
  final String complianceStatus;
  final String agentCompatible;

  ComplianceInfo({
    required this.complianceStatus,
    required this.agentCompatible,
  });
}

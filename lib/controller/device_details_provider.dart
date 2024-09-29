
import 'package:flutter/material.dart';

import '../model/DeviceDetail.dart';

class DeviceDetailsProvider extends ChangeNotifier {
  DeviceDetail? _deviceDetail;

  DeviceDetail? get deviceDetail => _deviceDetail;

  // Simulated API call that returns device details
  void fetchDeviceDetails() {
    _deviceDetail = DeviceDetail(
      deviceInfo: DeviceInfo(
        deviceKind: "Android Enterprise",
        deviceId: "990017655088421",
        enrollmentTime: "2023-09-15 11:42:50 AM",
        deviceFamily: "Android Plus",
        ipAddress: "192.168.0.235",
        agentOnline: "Yes",
        deviceMode: "Active",
        osVersion: "11",
        path: "\\Private Brands\\NSW",
      ),
      hardwareInfo: HardwareInfo(
        macAddress: "0c23698118cd",
        wifiMacAddress: "0c23698118cd",
        manufacturer: "Honeywell",
        model: "CT45P",
        totalMemory: "5.55 GB",
        totalSDCardStorage: "1.87 GB",
        totalStorage: "44.14 GB",
      ),
      userInfo: UserInfo(
        userAssigned: "No User Assigned",
      ),
      complianceInfo: ComplianceInfo(
        complianceStatus: "Compliant",
        agentCompatible: "Yes",
      ),
    );
    notifyListeners(); // Notify listeners that data has been fetched
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/device_details_provider.dart';
import 'model/DeviceDetail.dart';

// class DevicePopup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Device Details"),
//       ),
//       body: Consumer<DeviceDetailsProvider>(
//         builder: (context, provider, child) {
//           final deviceDetail = provider.deviceDetail;
//
//           if (deviceDetail == null) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   _buildComplianceCard(deviceDetail.complianceInfo),
//                   _buildUserDetailsCard(deviceDetail.userInfo),
//                   _buildDeviceDetailsCard(deviceDetail.deviceInfo),
//                   _buildHardwareDetailsCard(deviceDetail.hardwareInfo),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildComplianceCard(ComplianceInfo complianceInfo) {
//     return _buildInfoCard(
//       title: "Compliance",
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildInfoRow("Compliance Status", complianceInfo.complianceStatus),
//           _buildInfoRow("Agent Compatible", complianceInfo.agentCompatible),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildUserDetailsCard(UserInfo userInfo) {
//     return _buildInfoCard(
//       title: "User Details",
//       content: Column(
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Icon(Icons.person_outline, size: 50),
//                 SizedBox(height: 10),
//                 Text(userInfo.userAssigned),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDeviceDetailsCard(DeviceInfo deviceInfo) {
//     return _buildInfoCard(
//       title: "Device Details",
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildInfoRow("Device Kind", deviceInfo.deviceKind),
//           _buildInfoRow("Device ID", deviceInfo.deviceId),
//           _buildInfoRow("Enrollment Time", deviceInfo.enrollmentTime),
//           _buildInfoRow("Device Family", deviceInfo.deviceFamily),
//           _buildInfoRow("IP Address", deviceInfo.ipAddress),
//           _buildInfoRow("Agent Online", deviceInfo.agentOnline),
//           _buildInfoRow("Device Mode", deviceInfo.deviceMode),
//           _buildInfoRow("OS Version", deviceInfo.osVersion),
//           _buildInfoRow("Path", deviceInfo.path),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHardwareDetailsCard(HardwareInfo hardwareInfo) {
//     return _buildInfoCard(
//       title: "Hardware Details",
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildInfoRow("MAC Address", hardwareInfo.macAddress),
//           _buildInfoRow("Wifi MAC Address", hardwareInfo.wifiMacAddress),
//           _buildInfoRow("Manufacturer", hardwareInfo.manufacturer),
//           _buildInfoRow("Model", hardwareInfo.model),
//           _buildInfoRow("Total Memory", hardwareInfo.totalMemory),
//           _buildInfoRow("Total SD Card Storage", hardwareInfo.totalSDCardStorage),
//           _buildInfoRow("Total Storage", hardwareInfo.totalStorage),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//           Text(value),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoCard({required String title, required Widget content}) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             content,
//           ],
//         ),
//       ),
//     );
//   }
// }





// Popup with Tabs and Close Button
class DevicePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 200, top: 25),
      child: Column(
        children: [
          // Header with Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Device Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
          // TabBar and TabView
          Expanded(
            child: DefaultTabController(
              length: 8, // Number of tabs
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Device Details"),
                      Tab(text: "Compliance"),
                      Tab(text: "Configurations"),
                      Tab(text: "Applications"),
                      Tab(text: "Location"),
                      Tab(text: "Security"),
                      Tab(text: "Collected Data"),
                      Tab(text: "Logs"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildDeviceDetailsTab(),
                        _buildComplianceTab(),
                        _buildConfigurationsTab(),
                        _buildApplicationsTab(),
                        _buildLocationTab(),
                        _buildSecurityTab(),
                        _buildCollectedDataTab(),
                        _buildLogsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Device Details Tab (fetching details from Provider)
  Widget _buildDeviceDetailsTab() {
    return Consumer<DeviceDetailsProvider>(
      builder: (context, provider, child) {
        final deviceDetail = provider.deviceDetail;

        if (deviceDetail == null) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildComplianceCard(deviceDetail.complianceInfo),
                _buildUserDetailsCard(deviceDetail.userInfo),
                _buildDeviceDetailsCard(deviceDetail.deviceInfo),
                _buildHardwareDetailsCard(deviceDetail.hardwareInfo),
              ],
            ),
          ),
        );
      },
    );
  }

  // Placeholder for remaining tabs
  Widget _buildComplianceTab() => Center(child: Text("Compliance Tab"));
  Widget _buildConfigurationsTab() => Center(child: Text("Configurations Tab"));
  Widget _buildApplicationsTab() => Center(child: Text("Applications Tab"));
  Widget _buildLocationTab() => Center(child: Text("Location Tab"));
  Widget _buildSecurityTab() => Center(child: Text("Security Tab"));
  Widget _buildCollectedDataTab() => Center(child: Text("Collected Data Tab"));
  Widget _buildLogsTab() => Center(child: Text("Logs Tab"));

  // Reusable Card Components for Details
  Widget _buildComplianceCard(ComplianceInfo complianceInfo) {
    return _buildInfoCard(
      title: "Compliance",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Compliance Status", complianceInfo.complianceStatus),
          _buildInfoRow("Agent Compatible", complianceInfo.agentCompatible),
        ],
      ),
    );
  }

  Widget _buildUserDetailsCard(UserInfo userInfo) {
    return _buildInfoCard(
      title: "User Details",
      content: Column(
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.person_outline, size: 50),
                SizedBox(height: 10),
                Text(userInfo.userAssigned),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceDetailsCard(DeviceInfo deviceInfo) {
    return _buildInfoCard(
      title: "Device Details",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Device Kind", deviceInfo.deviceKind),
          _buildInfoRow("Device ID", deviceInfo.deviceId),
          _buildInfoRow("Enrollment Time", deviceInfo.enrollmentTime),
          _buildInfoRow("Device Family", deviceInfo.deviceFamily),
          _buildInfoRow("IP Address", deviceInfo.ipAddress),
          _buildInfoRow("Agent Online", deviceInfo.agentOnline),
          _buildInfoRow("Device Mode", deviceInfo.deviceMode),
          _buildInfoRow("OS Version", deviceInfo.osVersion),
          _buildInfoRow("Path", deviceInfo.path),
        ],
      ),
    );
  }

  Widget _buildHardwareDetailsCard(HardwareInfo hardwareInfo) {
    return _buildInfoCard(
      title: "Hardware Details",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("MAC Address", hardwareInfo.macAddress),
          _buildInfoRow("Wifi MAC Address", hardwareInfo.wifiMacAddress),
          _buildInfoRow("Manufacturer", hardwareInfo.manufacturer),
          _buildInfoRow("Model", hardwareInfo.model),
          _buildInfoRow("Total Memory", hardwareInfo.totalMemory),
          _buildInfoRow("Total SD Card Storage", hardwareInfo.totalSDCardStorage),
          _buildInfoRow("Total Storage", hardwareInfo.totalStorage),
        ],
      ),
    );
  }

  // Utility Widgets
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required Widget content}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
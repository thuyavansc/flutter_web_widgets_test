
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/device_details_provider.dart';
import 'model/DeviceDetail.dart';

// class DraggableResizablePopup extends StatefulWidget {
//   @override
//   _DraggableResizablePopupState createState() => _DraggableResizablePopupState();
// }
//
// class _DraggableResizablePopupState extends State<DraggableResizablePopup> {
//   // Initial position and size
//   double left = 200;
//   double top = 25;
//   double width = 1100;
//   double height = 600;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black54, // Modal background
//       body: Stack(
//         children: [
//           Positioned(
//             left: left,
//             top: top,
//             width: width,
//             height: height,
//             child: GestureDetector(
//               onPanUpdate: (details) {
//                 setState(() {
//                   // Update position when the widget is dragged
//                   left += details.delta.dx;
//                   top += details.delta.dy;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   //borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     // Header with Drag and Close Button
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Device Details', style: TextStyle(fontSize: 18, color: Colors.white)),
//                           IconButton(
//                             icon: Icon(Icons.close, color: Colors.white),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: DefaultTabController(
//                         length: 8, // Number of tabs
//                         child: Column(
//                           children: [
//                             TabBar(
//                               isScrollable: true,
//                               tabs: [
//                                 Tab(text: "Device Details"),
//                                 Tab(text: "Compliance"),
//                                 Tab(text: "Configurations"),
//                                 Tab(text: "Applications"),
//                                 Tab(text: "Location"),
//                                 Tab(text: "Security"),
//                                 Tab(text: "Collected Data"),
//                                 Tab(text: "Logs"),
//                               ],
//                             ),
//                             Expanded(
//                               child: TabBarView(
//                                 children: [
//                                   _buildDeviceDetailsTab(),
//                                   _buildComplianceTab(),
//                                   _buildConfigurationsTab(),
//                                   _buildApplicationsTab(),
//                                   _buildLocationTab(),
//                                   _buildSecurityTab(),
//                                   _buildCollectedDataTab(),
//                                   _buildLogsTab(),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Resizable Corner
//                     GestureDetector(
//                       onPanUpdate: (details) {
//                         setState(() {
//                           // Update size when resizing
//                           width += details.delta.dx;
//                           height += details.delta.dy;
//                         });
//                       },
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(Icons.open_in_full, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Placeholder for device details tabs
//   Widget _buildDeviceDetailsTab() {
//     return Consumer<DeviceDetailsProvider>(
//       builder: (context, provider, child) {
//         final deviceDetail = provider.deviceDetail;
//
//         if (deviceDetail == null) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 _buildComplianceCard(deviceDetail.complianceInfo),
//                 _buildUserDetailsCard(deviceDetail.userInfo),
//                 _buildDeviceDetailsCard(deviceDetail.deviceInfo),
//                 _buildHardwareDetailsCard(deviceDetail.hardwareInfo),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Placeholder for the remaining tabs
//   Widget _buildComplianceTab() => Center(child: Text("Compliance Tab"));
//   Widget _buildConfigurationsTab() => Center(child: Text("Configurations Tab"));
//   Widget _buildApplicationsTab() => Center(child: Text("Applications Tab"));
//   Widget _buildLocationTab() => Center(child: Text("Location Tab"));
//   Widget _buildSecurityTab() => Center(child: Text("Security Tab"));
//   Widget _buildCollectedDataTab() => Center(child: Text("Collected Data Tab"));
//   Widget _buildLogsTab() => Center(child: Text("Logs Tab"));
//
//   // Reusable info card widgets
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
//   // Utility Widgets
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



class DraggableResizablePopup extends StatefulWidget {
  final VoidCallback onClose;

  DraggableResizablePopup({required this.onClose});
  @override
  _DraggableResizablePopupState createState() => _DraggableResizablePopupState();
}

class _DraggableResizablePopupState extends State<DraggableResizablePopup> {
  // Initial position and size
  double left = 200;
  double top = 25;
  double width = 1100;
  double height = 600;
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54, // Modal background
      body: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            width: width,
            height: height,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  // Update position when the widget is dragged
                  left += details.delta.dx;
                  top += details.delta.dy;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header with Drag and Close Button
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Device Details', style: TextStyle(fontSize: 18, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              //Navigator.of(context).pop();
                              widget.onClose(); // Trigger onClose callback
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 8, // Number of tabs
                        child: Column(
                          children: [
                            _buildScrollableTabBar(),
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
                    // Resizable Corner
                    GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          // Update size when resizing
                          width += details.delta.dx;
                          height += details.delta.dy;
                        });
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.open_in_full, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableTabBar() {
    return StatefulBuilder(builder: (context, setState) {
      _tabController = DefaultTabController.of(context)!;

      return Row(
        children: [
          Expanded(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                Tab(child: Text('Device Details', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Compliance', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Configurations', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Applications', style: Theme.of(context).textTheme.labelMedium),),
                Tab( child: Text('Location', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Security', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Collected Data', style: Theme.of(context).textTheme.labelMedium),),
                Tab(child: Text('Logs', style: Theme.of(context).textTheme.labelMedium),),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              if (_tabController.index > 0) {
                _tabController.animateTo(_tabController.index - 1);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              if (_tabController.index < _tabController.length - 1) {
                _tabController.animateTo(_tabController.index + 1);
              }
            },
          ),
        ],
      );
    });
  }

  // Placeholder for device details tabs
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          _buildComplianceCard(deviceDetail.complianceInfo),
                          _buildDeviceDetailsCard(deviceDetail.deviceInfo),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          _buildUserDetailsCard(deviceDetail.userInfo),
                          _buildHardwareDetailsCard(deviceDetail.hardwareInfo),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Placeholder for the remaining tabs
  Widget _buildComplianceTab() => Center(child: Text("Compliance Tab"));
  Widget _buildConfigurationsTab() => Center(child: Text("Configurations Tab"));
  Widget _buildApplicationsTab() => Center(child: Text("Applications Tab"));
  Widget _buildLocationTab() => Center(child: Text("Location Tab"));
  Widget _buildSecurityTab() => Center(child: Text("Security Tab"));
  Widget _buildCollectedDataTab() => Center(child: Text("Collected Data Tab"));
  Widget _buildLogsTab() => Center(child: Text("Logs Tab"));

  // Reusable info card widgets
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
    return Container(
      width: 400,
      child: Card(
        elevation:0.11,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Adjust the radius value as needed
        ),
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
      ),
    );
  }
}




// Function to display DraggableResizablePopup using Overlay
void showDraggablePopup(BuildContext context) {
  OverlayState? overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => DraggableResizablePopup(onClose: () {
      overlayEntry.remove(); // Remove the popup when closed
    }),
  );

  overlayState?.insert(overlayEntry);
}

// class DraggableResizablePopup extends StatefulWidget {
//   final VoidCallback onClose;
//
//   DraggableResizablePopup({required this.onClose});
//
//   @override
//   _DraggableResizablePopupState createState() => _DraggableResizablePopupState();
// }
//
// class _DraggableResizablePopupState extends State<DraggableResizablePopup> {
//   // Initial position and size
//   double left = 200;
//   double top = 25;
//   double width = 600;
//   double height = 400;
//   late TabController _tabController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: left,
//       top: top,
//       width: width,
//       height: height,
//       child: GestureDetector(
//         onPanUpdate: (details) {
//           setState(() {
//             // Update position when the widget is dragged
//             left += details.delta.dx;
//             top += details.delta.dy;
//           });
//         },
//         child: Material(
//           color: Colors.transparent, // Transparent background
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 // Header with Drag and Close Button
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   color: Colors.blue,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Device Details', style: TextStyle(fontSize: 18, color: Colors.white)),
//                       IconButton(
//                         icon: Icon(Icons.close, color: Colors.white),
//                         onPressed: () {
//                           widget.onClose(); // Trigger onClose callback
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: DefaultTabController(
//                     length: 8, // Number of tabs
//                     child: Column(
//                       children: [
//                         _buildScrollableTabBar(),
//                         Expanded(
//                           child: TabBarView(
//                             children: [
//                               _buildDeviceDetailsTab(),
//                               _buildComplianceTab(),
//                               _buildConfigurationsTab(),
//                               _buildApplicationsTab(),
//                               _buildLocationTab(),
//                               _buildSecurityTab(),
//                               _buildCollectedDataTab(),
//                               _buildLogsTab(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Resizable Corner
//                 GestureDetector(
//                   onPanUpdate: (details) {
//                     setState(() {
//                       // Update size when resizing
//                       width += details.delta.dx;
//                       height += details.delta.dy;
//                     });
//                   },
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.open_in_full, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScrollableTabBar() {
//     return StatefulBuilder(builder: (context, setState) {
//       _tabController = DefaultTabController.of(context)!;
//
//       return Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               if (_tabController.index > 0) {
//                 _tabController.animateTo(_tabController.index - 1);
//               }
//             },
//           ),
//           Expanded(
//             child: TabBar(
//               controller: _tabController,
//               isScrollable: true,
//               tabs: [
//                 Tab(text: "Device Details"),
//                 Tab(text: "Compliance"),
//                 Tab(text: "Configurations"),
//                 Tab(text: "Applications"),
//                 Tab(text: "Location"),
//                 Tab(text: "Security"),
//                 Tab(text: "Collected Data"),
//                 Tab(text: "Logs"),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.arrow_forward),
//             onPressed: () {
//               if (_tabController.index < _tabController.length - 1) {
//                 _tabController.animateTo(_tabController.index + 1);
//               }
//             },
//           ),
//         ],
//       );
//     });
//   }
//
//   // Placeholder for device details tabs
//   Widget _buildDeviceDetailsTab() {
//     return Consumer<DeviceDetailsProvider>(
//       builder: (context, provider, child) {
//         final deviceDetail = provider.deviceDetail;
//
//         if (deviceDetail == null) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 _buildComplianceCard(deviceDetail.complianceInfo),
//                 _buildUserDetailsCard(deviceDetail.userInfo),
//                 _buildDeviceDetailsCard(deviceDetail.deviceInfo),
//                 _buildHardwareDetailsCard(deviceDetail.hardwareInfo),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Placeholder for the remaining tabs
//   Widget _buildComplianceTab() => Center(child: Text("Compliance Tab"));
//   Widget _buildConfigurationsTab() => Center(child: Text("Configurations Tab"));
//   Widget _buildApplicationsTab() => Center(child: Text("Applications Tab"));
//   Widget _buildLocationTab() => Center(child: Text("Location Tab"));
//   Widget _buildSecurityTab() => Center(child: Text("Security Tab"));
//   Widget _buildCollectedDataTab() => Center(child: Text("Collected Data Tab"));
//   Widget _buildLogsTab() => Center(child: Text("Logs Tab"));
//
//   // Reusable info card widgets
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
//   // Utility Widgets
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
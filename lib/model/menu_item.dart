
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData? icon;
  final List<MenuItem>? subMenuItems;

  MenuItem({
    required this.title,
    this.icon,
    this.subMenuItems,
  });
}


// List<MenuItem> buildMenu() {
//   return [
//     MenuItem(
//       title: 'Main Menu 1',
//       icon: Icons.home,
//       subMenuItems: [
//         MenuItem(
//           title: 'Submenu 1.1',
//           icon: Icons.access_alarm_outlined,
//           subMenuItems: [
//             MenuItem(title: 'Submenu 1.1.1', icon: Icons.settings),
//             MenuItem(title: 'Submenu 1.1.2', icon: Icons.settings),
//           ],
//         ),
//         MenuItem(title: 'Submenu 1.2', icon: Icons.settings),
//       ],
//     ),
//     MenuItem(
//       title: 'Main Menu 2',
//       icon: Icons.person,
//       subMenuItems: [
//         MenuItem(title: 'Submenu 2.1', icon: Icons.settings),
//       ],
//     ),
//   ];
// }

List<MenuItem> buildMenu() {
  return [
    MenuItem(
      title: 'Main Menu 1',
      icon: Icons.home,
      subMenuItems: [
        MenuItem(
          title: 'Submenu 1.1',
          icon: Icons.access_alarm_outlined,
          subMenuItems: [
            MenuItem(
              title: 'Submenu 1.1.1',
              icon: Icons.settings,
              subMenuItems: [
                MenuItem(
                  title: 'Submenu 1.1.1.1',
                  icon: Icons.build,
                  subMenuItems: [
                    MenuItem(
                      title: 'Submenu 1.1.1.1.1',
                      icon: Icons.security,
                    ),
                    MenuItem(
                      title: 'Submenu 1.1.1.1.2',
                      icon: Icons.shield,
                    ),
                  ],
                ),
                MenuItem(
                  title: 'Submenu 1.1.1.2',
                  icon: Icons.lock,
                ),
              ],
            ),
            MenuItem(title: 'Submenu 1.1.2', icon: Icons.alarm),
          ],
        ),
        MenuItem(title: 'Submenu 1.2', icon: Icons.settings),
        MenuItem(title: 'Submenu 1.3', icon: Icons.wifi),
        MenuItem(title: 'Submenu 1.4', icon: Icons.bluetooth),
        MenuItem(title: 'Submenu 1.5', icon: Icons.battery_charging_full),
      ],
    ),
    MenuItem(
      title: 'Main Menu 2',
      icon: Icons.person,
      subMenuItems: [
        MenuItem(
          title: 'Submenu 2.1',
          icon: Icons.directions_car,
          subMenuItems: [
            MenuItem(title: 'Submenu 2.1.1', icon: Icons.directions_bike),
            MenuItem(title: 'Submenu 2.1.2', icon: Icons.directions_boat),
            MenuItem(title: 'Submenu 2.1.3', icon: Icons.directions_bus),
            MenuItem(title: 'Submenu 2.1.4', icon: Icons.directions_railway),
          ],
        ),
        MenuItem(
          title: 'Submenu 2.2',
          icon: Icons.airplanemode_active,
        ),
        MenuItem(
          title: 'Submenu 2.3',
          icon: Icons.local_shipping,
        ),
        MenuItem(
          title: 'Submenu 2.4',
          icon: Icons.train,
        ),
      ],
    ),
  ];
}

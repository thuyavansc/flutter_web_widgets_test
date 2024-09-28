
import 'package:flutter/material.dart';

import 'controller/menu_provider.dart';
import 'model/menu_item.dart';
import 'package:provider/provider.dart';

// class CustomSidemenu extends StatefulWidget {
//   final List<MenuItem> menuItems;
//   final Function(MenuItem) onMenuItemTap;
//
//   const CustomSidemenu({
//     Key? key,
//     required this.menuItems,
//     required this.onMenuItemTap,
//   }) : super(key: key);
//
//   @override
//   _CustomSidemenuState createState() => _CustomSidemenuState();
// }
//
// class _CustomSidemenuState extends State<CustomSidemenu> {
//   // To keep track of which menu items are expanded
//   final Map<MenuItem, bool> _expandedState = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: widget.menuItems
//             .map((item) => _buildMenuItem(item, context))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(MenuItem menuItem, BuildContext context, {int depth = 0}) {
//     bool isExpanded = _expandedState[menuItem] ?? false;
//     bool hasSubmenu = menuItem.subMenuItems != null && menuItem.subMenuItems!.isNotEmpty;
//
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.only(left: 16.0 * depth),
//           leading: hasSubmenu
//               ? IconButton(
//             icon: Icon(
//               isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
//             ),
//             onPressed: () {
//               setState(() {
//                 _expandedState[menuItem] = !isExpanded;
//               });
//             },
//           )
//               : const SizedBox(width: 24), // Placeholder when no toggle needed
//           title: Row(
//             children: [
//               Icon(menuItem.icon ?? Icons.folder, size: 20),
//               SizedBox(width: 10),
//               Text(menuItem.title),
//             ],
//           ),
//           onTap: () {
//             widget.onMenuItemTap(menuItem);
//
//             // If it has submenu, toggle it on tap
//             if (hasSubmenu) {
//               setState(() {
//                 _expandedState[menuItem] = !isExpanded;
//               });
//             }
//           },
//         ),
//         if (isExpanded && hasSubmenu)
//           Column(
//             children: menuItem.subMenuItems!
//                 .map((submenu) => _buildMenuItem(submenu, context, depth: depth + 1))
//                 .toList(),
//           ),
//       ],
//     );
//   }
// }



// class CustomSidemenu extends StatefulWidget {
//   final List<MenuItem> menuItems;
//   final Function(MenuItem) onMenuItemTap;
//
//   const CustomSidemenu({
//     Key? key,
//     required this.menuItems,
//     required this.onMenuItemTap,
//   }) : super(key: key);
//
//   @override
//   _CustomSidemenuState createState() => _CustomSidemenuState();
// }
//
// class _CustomSidemenuState extends State<CustomSidemenu> {
//   final Map<MenuItem, bool> _expandedState = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: widget.menuItems
//             .map((item) => _buildMenuItem(item, context))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(MenuItem menuItem, BuildContext context, {int depth = 0}) {
//     bool isExpanded = _expandedState[menuItem] ?? false;
//     bool hasSubmenu = menuItem.subMenuItems != null && menuItem.subMenuItems!.isNotEmpty;
//
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.only(left: 16.0 * depth),
//           leading: hasSubmenu
//               ? IconButton(
//             icon: Icon(
//               isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
//             ),
//             onPressed: () {
//               setState(() {
//                 _expandedState[menuItem] = !isExpanded;
//               });
//             },
//           )
//               : const SizedBox(width: 24), // Placeholder when no toggle needed
//           title: Row(
//             children: [
//               Icon(menuItem.icon ?? Icons.folder, size: 20),
//               SizedBox(width: 10),
//               Text(menuItem.title),
//             ],
//           ),
//           onTap: () {
//             widget.onMenuItemTap(menuItem);
//
//             if (hasSubmenu) {
//               setState(() {
//                 _expandedState[menuItem] = !isExpanded;
//               });
//             }
//           },
//         ),
//         if (isExpanded && hasSubmenu)
//           Column(
//             children: menuItem.subMenuItems!
//                 .map((submenu) => _buildMenuItem(submenu, context, depth: depth + 1))
//                 .toList(),
//           ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSidemenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final Function(MenuItem) onMenuItemTap;

  const CustomSidemenu({
    Key? key,
    required this.menuItems,
    required this.onMenuItemTap,
  }) : super(key: key);

  @override
  _CustomSidemenuState createState() => _CustomSidemenuState();
}

class _CustomSidemenuState extends State<CustomSidemenu> {
  final Map<MenuItem, bool> _expandedState = {};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: widget.menuItems
            .map((item) => _buildMenuItem(item, context))
            .toList(),
      ),
    );
  }

  Widget _buildMenuItem(MenuItem menuItem, BuildContext context, {int depth = 0}) {
    bool isExpanded = _expandedState[menuItem] ?? false;
    bool hasSubmenu = menuItem.subMenuItems != null && menuItem.subMenuItems!.isNotEmpty;

    // Get the selected menu item from the provider
    MenuSelectionProvider menuProvider = Provider.of<MenuSelectionProvider>(context);
    bool isSelected = menuProvider.selectedMenuItem == menuItem;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 16.0 * depth),
          leading: hasSubmenu
              ? IconButton(
            icon: Icon(
              isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
            ),
            onPressed: () {
              setState(() {
                _expandedState[menuItem] = !isExpanded;
              });
            },
          )
              : const SizedBox(width: 24), // Placeholder when no toggle needed
          title: Row(
            children: [
              Icon(menuItem.icon ?? Icons.folder, size: 20),
              SizedBox(width: 10),
              Text(menuItem.title),
            ],
          ),
          tileColor: isSelected ? Colors.grey[300] : Colors.transparent, // Highlight selected item
          onTap: () {
            // Update the selected menu item in the provider
            menuProvider.selectMenuItem(menuItem);

            // Call the provided callback
            widget.onMenuItemTap(menuItem);

            // Toggle the expansion state for submenu items
            if (hasSubmenu) {
              setState(() {
                _expandedState[menuItem] = !isExpanded;
              });
            }
          },
        ),
        if (isExpanded && hasSubmenu)
          Column(
            children: menuItem.subMenuItems!
                .map((submenu) => _buildMenuItem(submenu, context, depth: depth + 1))
                .toList(),
          ),
      ],
    );
  }
}

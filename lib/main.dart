import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_widgets_test/paginated_datatable_example.dart';
import 'controller/datatable_provider.dart';
import 'controller/device_details_provider.dart';
import 'controller/menu_provider.dart';
import 'custom_sidemenu.dart';
import 'device_popup.dart';
import 'draggable_resizable_popup.dart';
import 'features/flutter_crud_table/example/api_data_table_example.dart';
import 'features/flutter_crud_table/example/crud_table_example.dart';
import 'features/flutter_crud_table/example/data_table_example.dart';
import 'features/flutter_crud_table/example/simple_table.dart';
import 'model/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             CustomSearchField(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }



// class CustomSearchField extends StatelessWidget {
//   const CustomSearchField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//           hintText: "Search",
//           hintStyle: TextStyle(color: Colors.blue),
//           fillColor: Colors.blue,
//           filled: true,
//           border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.all(Radius.circular(10))
//           ),
//           suffixIcon: InkWell(
//             onTap: (){},
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal:  16*0.55 , vertical:16*0.25 ),
//               margin: EdgeInsets.symmetric(horizontal: 16/2, vertical:  16/8),
//               decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: BorderRadius.all(Radius.circular(10))
//               ),
//               child: SvgPicture.asset('icons/Search.svg'),
//             ),
//           )
//       ),
//       style: Theme.of(context).textTheme.bodyMedium,
//     );
//   }
// }



// class CustomSearchField extends StatelessWidget {
//   const CustomSearchField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         hintStyle: TextStyle(color: Colors.blue),
//         fillColor: Colors.blue,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         contentPadding: EdgeInsets.zero, // Remove padding around the text
//         isDense: true, // Makes the field less tall
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: EdgeInsets.zero, // Remove padding inside the icon container
//             margin: EdgeInsets.zero, // Remove margin around the icon container
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset('icons/Search.svg'),
//           ),
//         ),
//       ),
//       style: Theme.of(context).textTheme.bodyMedium,
//     );
//   }
// }



// class CustomSearchField extends StatelessWidget {
//   const CustomSearchField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         hintStyle: TextStyle(color: Colors.blue),
//         fillColor: Colors.blue,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         isDense: true, // Reduces the height of the TextField
//         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8), // Control space inside TextField
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: EdgeInsets.zero, // No padding inside the icon container
//             margin: EdgeInsets.zero, // No margin around the icon container
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset(
//               'icons/Search.svg',
//               width: 5, // Explicitly control the icon size
//               height: 5,
//               fit: BoxFit.contain, // Ensure the icon fits within its bounds
//             ),
//           ),
//         ),
//       ),
//       style: Theme.of(context).textTheme.bodyMedium,
//     );
//   }
// }



// class CustomSearchField extends StatelessWidget {
//   const CustomSearchField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.blue,
//       ),
//       padding: EdgeInsets.zero, // Add padding to the container for overall spacing
//       child: Row(
//         children: [
//           // TextField on the left
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search",
//                 hintStyle: TextStyle(color: Colors.white),
//                 fillColor: Colors.blue,
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8), // Adjust padding
//                 isDense: true,
//               ),
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//           ),
//           //InkWell on the right for the search icon
//           InkWell(
//             onTap: () {
//               // Action for the search icon
//             },
//             child: Container(
//               padding: EdgeInsets.all(6), // Adjust padding for the icon
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: SvgPicture.asset(
//                 'icons/Search.svg',
//                 width: 20, // Explicitly control the icon size
//                 height: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Dynamic Menu')),
//         drawer: CustomSidemenu(
//           menuItems: buildMenu(),
//           onMenuItemTap: (menuItem) {
//             // Handle navigation or other actions here
//             print('Selected: ${menuItem.title}');
//           },
//         ),
//         body: Center(child: Text('Content goes here')),
//       ),
//     );
//   }
//
// }




// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MenuSelectionProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Dynamic Menu')),
//         drawer: CustomSidemenu(
//           menuItems: buildMenu(),
//           onMenuItemTap: (menuItem) {
//             print('Selected: ${menuItem.title}');
//           },
//         ),
//         body: Center(child: Text('Content goes here')),
//       ),
//     );
//   }
// }



// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DataProvider()),
//         ChangeNotifierProvider(create: (_) => MenuSelectionProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Dynamic Menu')),
//         // drawer: CustomSidemenu(
//         //   menuItems: buildMenu(),
//         //   onMenuItemTap: (menuItem) {
//         //     print('Selected: ${menuItem.title}');
//         //   },
//         // ),
//         body: PaginatedDataTableExample(),
//       ),
//     );
//   }
// }



//Data table
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DataProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PaginatedDataTableExample(),
//     );
//   }
// }




// Main Function and Provider Setup
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DeviceDetailsProvider()..fetchDeviceDetails()),
//       ],
//       child: MaterialApp(
//         home: MyApp(),
//       ),
//     ),
//   );
// }
//
// // MyApp with Button to open Popup
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Management'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger to show the popup window
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return DevicePopup();
//               },
//             );
//           },
//           child: Text('Open Device Details'),
//         ),
//       ),
//     );
//   }
// }


//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DeviceDetailsProvider()..fetchDeviceDetails()),
//       ],
//       child: MaterialApp(
//         home: MyApp(),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Management'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => DraggableResizablePopup()),
//             );
//           },
//           child: Text('Open Device Details'),
//         ),
//       ),
//     );
//   }
// }



// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DeviceDetailsProvider()..fetchDeviceDetails()),
//       ],
//       child: MaterialApp(
//         home: MyApp(),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Management'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Show the popup using Overlay
//             showDraggablePopup(context);
//           },
//           child: Text('Open Device Details'),
//         ),
//       ),
//     );
//   }
// }





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: SimpleTableExample(),
      //home: DataTableExample(),
      //home: CRUDTableExample(),
      home: ApiDataTableExample(),
    );
  }
}

// example/crud_table_example.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import '../crud_table/crud_table_controller.dart';
import '../crud_table/crud_table_widget.dart';
import '../data_table/data_table_controller.dart';
import '../data_table/data_table_widget.dart';

// class Item {
//   String name;
//   int quantity;
//   double price;
//
//   Item({
//     required this.name,
//     required this.quantity,
//     required this.price,
//   });
//
//   @override
//   String toString() {
//     return '$name';
//   }
// }
//
// class CRUDTableExample extends StatefulWidget {
//   const CRUDTableExample({Key? key}) : super(key: key);
//
//   @override
//   _CRUDTableExampleState createState() => _CRUDTableExampleState();
// }
//
// class _CRUDTableExampleState extends State<CRUDTableExample> {
//   late CRUDTableController<Item> crudController;
//   late DataTableController<Item> dataTableController;
//
//   @override
//   void initState() {
//     super.initState();
//     final initialItems = [
//       Item(name: 'Apple', quantity: 10, price: 1.5),
//       Item(name: 'Banana', quantity: 20, price: 0.75),
//       Item(name: 'Orange', quantity: 15, price: 1.0),
//     ];
//     crudController = CRUDTableController<Item>(initialItems: initialItems);
//     dataTableController = DataTableController<Item>(initialItems: initialItems);
//   }
//
//   void _applySelection(List<Item> selectedItems) {
//     // Perform actions with selected items
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Selected ${selectedItems.length} items')),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final headers = [
//       TableHeader<Item>(
//         name: 'Name',
//         valueGetter: (item) => item.name,
//       ),
//       TableHeader<Item>(
//         name: 'Quantity',
//         valueGetter: (item) => item.quantity.toString(),
//       ),
//       TableHeader<Item>(
//         name: 'Price',
//         valueGetter: (item) => '\$${item.price.toStringAsFixed(2)}',
//       ),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('CRUD Table with Selection')),
//       body: CRUDTableWidget<Item>(
//         title: 'Items',
//         headers: headers,
//         controller: crudController,
//         dataTableController: dataTableController,
//         addFormBuilder: (context, onAdd) {
//           final nameController = TextEditingController();
//           final quantityController = TextEditingController();
//           final priceController = TextEditingController();
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text('Add New Item', style: TextStyle(fontSize: 18)),
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Name'),
//                   ),
//                   TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: 'Quantity'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Price'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       final newItem = Item(
//                         name: nameController.text,
//                         quantity: int.parse(quantityController.text),
//                         price: double.parse(priceController.text),
//                       );
//                       onAdd(newItem);
//                     },
//                     child: const Text('Add'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         editFormBuilder: (context, item, onEdit) {
//           final nameController = TextEditingController(text: item.name);
//           final quantityController = TextEditingController(text: item.quantity.toString());
//           final priceController = TextEditingController(text: item.price.toString());
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text('Edit Item', style: TextStyle(fontSize: 18)),
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Name'),
//                   ),
//                   TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: 'Quantity'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Price'),
//                     keyboardType: TextInputType.number,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       final editedItem = Item(
//                         name: nameController.text,
//                         quantity: int.parse(quantityController.text),
//                         price: double.parse(priceController.text),
//                       );
//                       onEdit(editedItem);
//                     },
//                     child: const Text('Save'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final selectedItems = dataTableController.displayedItems.where((item) => item.quantity > 10).toList();
//           _applySelection(selectedItems);
//         },
//         child: const Icon(Icons.check),
//         tooltip: 'Apply Selection',
//       ),
//     );
//   }
// }





class Item {
  String name;
  int quantity;
  double price;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  String toString() {
    return '$name';
  }
}

class CRUDTableExample extends StatefulWidget {
  const CRUDTableExample({Key? key}) : super(key: key);

  @override
  _CRUDTableExampleState createState() => _CRUDTableExampleState();
}

class _CRUDTableExampleState extends State<CRUDTableExample> {
  late DataTableController<Item> dataTableController;

  @override
  void initState() {
    super.initState();
    final initialItems = [
      Item(name: 'Apple', quantity: 10, price: 1.5),
      Item(name: 'Banana', quantity: 20, price: 0.75),
      Item(name: 'Orange', quantity: 15, price: 1.0),
    ];
    dataTableController = DataTableController<Item>(
      initialItems: initialItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    final headers = [
      TableHeader<Item>(
        name: 'Name',
        valueGetter: (item) => item.name,
      ),
      TableHeader<Item>(
        name: 'Quantity',
        valueGetter: (item) => item.quantity.toString(),
      ),
      TableHeader<Item>(
        name: 'Price',
        valueGetter: (item) => '\$${item.price.toStringAsFixed(2)}',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Table Example')),
      body: CRUDTableWidget<Item>(
        title: 'Items',
        headers: headers,
        dataTableController: dataTableController,
        addFormBuilder: (context, onAdd) {
          final nameController = TextEditingController();
          final quantityController = TextEditingController();
          final priceController = TextEditingController();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Add New Item', style: TextStyle(fontSize: 18)),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: quantityController,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final newItem = Item(
                        name: nameController.text,
                        quantity: int.parse(quantityController.text),
                        price: double.parse(priceController.text),
                      );
                      onAdd(newItem);
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
        editFormBuilder: (context, item, onEdit) {
          final nameController = TextEditingController(text: item.name);
          final quantityController = TextEditingController(text: item.quantity.toString());
          final priceController = TextEditingController(text: item.price.toString());
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Edit Item', style: TextStyle(fontSize: 18)),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: quantityController,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final editedItem = Item(
                        name: nameController.text,
                        quantity: int.parse(quantityController.text),
                        price: double.parse(priceController.text),
                      );
                      onEdit(editedItem);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

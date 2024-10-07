
// lib/crud_table/crud_table_widget.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import '../data_table/data_table_controller.dart';
import '../data_table/data_table_widget.dart';
import 'crud_table_controller.dart';

// typedef AddCallback<T> = void Function(T item);
// typedef EditCallback<T> = void Function(T item);
// typedef DeleteCallback<T> = void Function(T item);
//
// class CRUDTableWidget<T> extends StatefulWidget {
//   final String title;
//   final List<TableHeader<T>> headers;
//   final CRUDTableController<T> controller;
//   final DataTableController<T> dataTableController;
//   final Widget Function(BuildContext context, void Function(T item) onAdd)? addFormBuilder;
//   final Widget Function(BuildContext context, T item, void Function(T item) onEdit)? editFormBuilder;
//   final bool showSearch;
//   final bool showPagination;
//
//   const CRUDTableWidget({
//     Key? key,
//     required this.title,
//     required this.headers,
//     required this.controller,
//     required this.dataTableController,
//     this.addFormBuilder,
//     this.editFormBuilder,
//     this.showSearch = true,
//     this.showPagination = true,
//   }) : super(key: key);
//
//   @override
//   _CRUDTableWidgetState<T> createState() => _CRUDTableWidgetState<T>();
// }
//
// class _CRUDTableWidgetState<T> extends State<CRUDTableWidget<T>> {
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(_onControllerChanged);
//   }
//
//   void _onControllerChanged() {
//     widget.dataTableController.setItems(widget.controller.items);
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   void _addItem() {
//     if (widget.addFormBuilder != null) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(
//             child: widget.addFormBuilder!(context, (newItem) {
//               widget.controller.addItem(newItem);
//               Navigator.pop(context);
//             }),
//           );
//         },
//       );
//     }
//   }
//
//   void _editItem(T item) {
//     if (widget.editFormBuilder != null) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(
//             child: widget.editFormBuilder!(context, item, (editedItem) {
//               widget.controller.updateItem(item, editedItem);
//               Navigator.pop(context);
//             }),
//           );
//         },
//       );
//     }
//   }
//
//   void _deleteItem(T item) {
//     widget.controller.deleteItem(item);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final actionHeaders = [
//       ...widget.headers,
//       TableHeader<T>(
//         name: 'Actions',
//         widgetBuilder: (item) {
//           return Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.edit),
//                 onPressed: () => _editItem(item),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: () => _deleteItem(item),
//               ),
//             ],
//           );
//         },
//       ),
//     ];
//
//     return Column(
//       children: [
//         // Toolbar with Add button
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(widget.title, style: Theme.of(context).textTheme.bodySmall),
//             ElevatedButton(
//               onPressed: _addItem,
//               child: const Text('Add New'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Expanded(
//           child: DataTableWidget<T>(
//             headers: actionHeaders,
//             controller: widget.dataTableController,
//             showSearch: widget.showSearch,
//             showPagination: widget.showPagination,
//           ),
//         ),
//       ],
//     );
//   }
// }




typedef AddCallback<T> = void Function(T item);
typedef EditCallback<T> = void Function(T item);
typedef DeleteCallback<T> = void Function(T item);

class CRUDTableWidget<T> extends StatefulWidget {
  final String title;
  final List<TableHeader<T>> headers;
  final DataTableController<T> dataTableController;
  final Widget Function(BuildContext context, void Function(T item) onAdd)? addFormBuilder;
  final Widget Function(BuildContext context, T item, void Function(T item) onEdit)? editFormBuilder;
  final bool showSearch;
  final bool showPagination;

  const CRUDTableWidget({
    Key? key,
    required this.title,
    required this.headers,
    required this.dataTableController,
    this.addFormBuilder,
    this.editFormBuilder,
    this.showSearch = true,
    this.showPagination = true,
  }) : super(key: key);

  @override
  _CRUDTableWidgetState<T> createState() => _CRUDTableWidgetState<T>();
}

class _CRUDTableWidgetState<T> extends State<CRUDTableWidget<T>> {
  @override
  void initState() {
    super.initState();
    widget.dataTableController.refresh(); // Load initial data
  }

  void _addItem() {
    if (widget.addFormBuilder != null) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: widget.addFormBuilder!(context, (newItem) {
              widget.dataTableController.addItem(newItem);
              Navigator.pop(context);
            }),
          );
        },
      );
    }
  }

  void _editItem(T item) {
    if (widget.editFormBuilder != null) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: widget.editFormBuilder!(context, item, (editedItem) {
              widget.dataTableController.updateItem(item, editedItem);
              Navigator.pop(context);
            }),
          );
        },
      );
    }
  }

  void _deleteItem(T item) {
    widget.dataTableController.deleteItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final actionHeaders = [
      ...widget.headers,
      TableHeader<T>(
        name: 'Actions',
        widgetBuilder: (item) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _editItem(item),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteItem(item),
              ),
            ],
          );
        },
      ),
    ];

    return Column(
      children: [
        // Toolbar with Add button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.bodySmall),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add New'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: DataTableWidget<T>(
            headers: actionHeaders,
            controller: widget.dataTableController,
            showSearch: widget.showSearch,
            showPagination: widget.showPagination,
          ),
        ),
      ],
    );
  }
}

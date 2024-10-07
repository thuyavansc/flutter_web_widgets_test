
// lib/data_table/pagination_widget.dart
import 'package:flutter/material.dart';
import 'data_table_controller.dart';

// class PaginationWidget<T> extends StatelessWidget {
//   final DataTableController<T> controller;
//
//   const PaginationWidget({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Items per page dropdown
//         Row(
//           children: [
//             const Text('Items per page: '),
//             DropdownButton<int>(
//               value: controller.itemsPerPage,
//               items: [5, 10, 15, 25, 50].map((value) {
//                 return DropdownMenuItem(
//                   value: value,
//                   child: Text('$value'),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   controller.setItemsPerPage(value);
//                 }
//               },
//             ),
//           ],
//         ),
//         // Pagination buttons
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.first_page),
//               onPressed: controller.page > 1
//                   ? () {
//                 controller.setPage(1);
//               }
//                   : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.chevron_left),
//               onPressed: controller.page > 1
//                   ? () {
//                 controller.setPage(controller.page - 1);
//               }
//                   : null,
//             ),
//             Text('Page ${controller.page} of ${controller.totalPages}'),
//             IconButton(
//               icon: const Icon(Icons.chevron_right),
//               onPressed: controller.page < controller.totalPages
//                   ? () {
//                 controller.setPage(controller.page + 1);
//               }
//                   : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.last_page),
//               onPressed: controller.page < controller.totalPages
//                   ? () {
//                 controller.setPage(controller.totalPages);
//               }
//                   : null,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }




class PaginationWidget<T> extends StatelessWidget {
  final DataTableController<T> controller;

  const PaginationWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPages = controller.totalPages;
    final currentPage = controller.page;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: totalPages > 1
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Items per page dropdown
          Row(
            children: [
              const Text('Items per page: '),
              DropdownButton<int>(
                value: controller.itemsPerPage,
                items: [5, 10, 15, 25, 50].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.setItemsPerPage(value);
                  }
                },
              ),
            ],
          ),
          // Pagination buttons
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.first_page),
                onPressed: currentPage > 1
                    ? () {
                  controller.setPage(1);
                }
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: currentPage > 1
                    ? () {
                  controller.setPage(currentPage - 1);
                }
                    : null,
              ),
              Text('Page $currentPage of $totalPages'),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: currentPage < totalPages
                    ? () {
                  controller.setPage(currentPage + 1);
                }
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.last_page),
                onPressed: currentPage < totalPages
                    ? () {
                  controller.setPage(totalPages);
                }
                    : null,
              ),
            ],
          ),
        ],
      )
          : Container(), // Hide pagination if only one page
    );
  }
}

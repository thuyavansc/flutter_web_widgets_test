
// lib/data_table/data_table_widget.dart
import 'package:flutter/material.dart';
import '../components/table_header.dart';
import 'data_table_controller.dart';
import 'pagination_widget.dart';

// class DataTableWidget<T> extends StatefulWidget {
//   final List<TableHeader<T>> headers;
//   final DataTableController<T> controller;
//   final bool showSearch;
//   final bool showPagination;
//   final bool expandable;
//   final Widget Function(T item)? expandedBuilder;
//   final Function(T item, String query)? searchMatcher;
//   final Function(T item)? onRowTap;
//   final bool selectable;
//   final List<T>? selectedItems;
//   final Function(List<T> selectedItems)? onSelectionChanged;
//
//   const DataTableWidget({
//     Key? key,
//     required this.headers,
//     required this.controller,
//     this.showSearch = true,
//     this.showPagination = true,
//     this.expandable = false,
//     this.expandedBuilder,
//     this.searchMatcher,
//     this.onRowTap,
//     this.selectable = false,
//     this.selectedItems,
//     this.onSelectionChanged,
//   }) : super(key: key);
//
//   @override
//   _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
// }
//
// class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
//   Set<T> expandedItems = {};
//   Set<T> selectedItems = {};
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.selectedItems != null) {
//       selectedItems = widget.selectedItems!.toSet();
//     }
//     widget.controller.addListener(_onControllerChanged);
//   }
//
//   void _onControllerChanged() {
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(_onControllerChanged);
//     super.dispose();
//   }
//
//   bool _matchesSearch(T item) {
//     if (widget.controller.searchQuery.isEmpty) {
//       return true;
//     }
//     if (widget.searchMatcher != null) {
//       return widget.searchMatcher!(item, widget.controller.searchQuery);
//     }
//     return item.toString().toLowerCase().contains(widget.controller.searchQuery.toLowerCase());
//   }
//
//   void _toggleExpanded(T item) {
//     setState(() {
//       if (expandedItems.contains(item)) {
//         expandedItems.remove(item);
//       } else {
//         expandedItems.add(item);
//       }
//     });
//   }
//
//   void _toggleSelected(T item) {
//     setState(() {
//       if (selectedItems.contains(item)) {
//         selectedItems.remove(item);
//       } else {
//         selectedItems.add(item);
//       }
//       if (widget.onSelectionChanged != null) {
//         widget.onSelectionChanged!(selectedItems.toList());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<T> filteredItems = widget.controller.items.where(_matchesSearch).toList();
//     widget.controller.items = filteredItems;
//
//     final displayedItems = widget.controller.displayedItems;
//
//     return Column(
//       children: [
//         if (widget.showSearch)
//         // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Search...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 widget.controller.setSearchQuery(value);
//               },
//             ),
//           ),
//         // Table headers
//         Container(
//           color: Theme.of(context).dividerColor,
//           child: Row(
//             children: [
//               if (widget.selectable)
//                 const SizedBox(
//                   width: 48,
//                   child: Center(child: Text('Select')),
//                 ),
//               ...widget.headers.map((header) {
//                 return Expanded(
//                   flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       header.name,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//         // Table rows
//         Expanded(
//           child: ListView.builder(
//             itemCount: displayedItems.length,
//             itemBuilder: (context, index) {
//               final item = displayedItems[index];
//               final isExpanded = expandedItems.contains(item);
//               final isSelected = selectedItems.contains(item);
//               return Column(
//                 children: [
//                   GestureDetector(
//                     onTap: widget.onRowTap != null
//                         ? () {
//                       widget.onRowTap!(item);
//                     }
//                         : null,
//                     child: Container(
//                       color: isExpanded ? Colors.grey[200] : null,
//                       child: Row(
//                         children: [
//                           if (widget.selectable)
//                             SizedBox(
//                               width: 48,
//                               child: Checkbox(
//                                 value: isSelected,
//                                 onChanged: (value) {
//                                   _toggleSelected(item);
//                                 },
//                               ),
//                             ),
//                           ...widget.headers.map((header) {
//                             Widget content;
//                             if (header.widgetBuilder != null) {
//                               content = header.widgetBuilder!(item);
//                             } else if (header.valueGetter != null) {
//                               final value = header.valueGetter!(item);
//                               content = Text(value);
//                             } else {
//                               content = const SizedBox();
//                             }
//                             return Expanded(
//                               flex: header.width != null ? (header.width! * 100).toInt() : 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: content,
//                               ),
//                             );
//                           }).toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (isExpanded && widget.expandedBuilder != null)
//                     widget.expandedBuilder!(item),
//                 ],
//               );
//             },
//           ),
//         ),
//         if (widget.showPagination)
//         // Pagination controls
//           PaginationWidget<T>(controller: widget.controller),
//       ],
//     );
//   }
// }




class DataTableWidget<T> extends StatefulWidget {
  final List<TableHeader<T>> headers;
  final DataTableController<T> controller;
  final bool showSearch;
  final bool showPagination;
  final bool selectable;
  final Function(T item)? onRowTap;
  final List<T>? selectedItems;
  final Function(List<T> selectedItems)? onSelectionChanged;

  const DataTableWidget({
    Key? key,
    required this.headers,
    required this.controller,
    this.showSearch = true,
    this.showPagination = true,
    this.selectable = false,
    this.onRowTap,
    this.selectedItems,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  _DataTableWidgetState<T> createState() => _DataTableWidgetState<T>();
}

class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
  Set<T> selectedItems = {};

  @override
  void initState() {
    super.initState();
    if (widget.selectedItems != null) {
      selectedItems = widget.selectedItems!.toSet();
    }
    widget.controller.addListener(_onControllerChanged);
    widget.controller.refresh(); // Initial data fetch
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _toggleSelected(T item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(selectedItems.toList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Column(
      children: [
        if (widget.showSearch)
        // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.setSearchQuery(value);
              },
            ),
          ),
        Expanded(
          child: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.items.isEmpty
              ? const Center(child: Text('No items found.'))
              : ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              final isSelected = selectedItems.contains(item);
              return GestureDetector(
                onTap: widget.onRowTap != null
                    ? () {
                  widget.onRowTap!(item);
                }
                    : null,
                child: Container(
                  color: isSelected ? Colors.grey[300] : null,
                  child: Row(
                    children: [
                      if (widget.selectable)
                        SizedBox(
                          width: 48,
                          child: Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              _toggleSelected(item);
                            },
                          ),
                        ),
                      ...widget.headers.map((header) {
                        Widget content;
                        if (header.widgetBuilder != null) {
                          content = header.widgetBuilder!(item);
                        } else if (header.valueGetter != null) {
                          final value = header.valueGetter!(item);
                          content = Text(value);
                        } else {
                          content = const SizedBox();
                        }
                        return Expanded(
                          flex: header.width != null ? (header.width! * 100).toInt() : 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: content,
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.showPagination)
        // Pagination controls
          PaginationWidget<T>(controller: controller),
      ],
    );
  }
}

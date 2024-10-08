
// lib/components/table_header.dart
import 'package:flutter/material.dart';

// typedef ValueGetter<T> = String Function(T item);
// typedef WidgetBuilderFunction<T> = Widget Function(T item);
//
// class TableHeader<T> {
//   final String name;
//   final ValueGetter<T>? valueGetter;
//   final WidgetBuilderFunction<T>? widgetBuilder;
//   final double? width;
//
//   TableHeader({
//     required this.name,
//     this.valueGetter,
//     this.widgetBuilder,
//     this.width,
//   });
// }



typedef ValueGetter<T> = String Function(T item);
typedef WidgetBuilderFunction<T> = Widget Function(T item);
typedef SearchMatcher<T> = bool Function(T item, String searchQuery);

class TableHeader<T> {
  final String name;
  final ValueGetter<T>? valueGetter;
  final WidgetBuilderFunction<T>? widgetBuilder;
  final double? width;

  TableHeader({
    required this.name,
    this.valueGetter,
    this.widgetBuilder,
    this.width,
  });
}
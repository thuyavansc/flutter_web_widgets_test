
// lib/components/object_preview.dart
import 'package:flutter/material.dart';
import 'key_value.dart';
import 'table_header.dart';

class ObjectPreview<T> extends StatelessWidget {
  final List<TableHeader<T>> headers;
  final T item;

  const ObjectPreview({
    Key? key,
    required this.headers,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: headers.map((header) {
        Widget content;
        if (header.widgetBuilder != null) {
          content = header.widgetBuilder!(item);
        } else if (header.valueGetter != null) {
          final value = header.valueGetter!(item);
          content = Text(value);
        } else {
          content = const SizedBox();
        }
        return KeyValue(
          name: header.name,
          child: content,
        );
      }).toList(),
    );
  }
}


// lib/components/key_value.dart
import 'package:flutter/material.dart';

class KeyValue extends StatelessWidget {
  final String name;
  final String? value;
  final Widget? child;

  const KeyValue({
    Key? key,
    required this.name,
    this.value,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$name:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        if (child != null)
          child!
        else if (value != null)
          Text(
            value!,
            style: TextStyle(color: Colors.grey[600]),
          ),
      ],
    );
  }
}

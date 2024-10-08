
// class Item {
//   int id;
//   String name;
//   String email;
//
//   Item({required this.id, required this.name, required this.email});
//
//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }


class Item {
  int id;
  String name;
  String email;
  String? details;

  Item({required this.id, required this.name, required this.email, this.details});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      details: json['details'] ?? 'No details available.',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Item && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;
}

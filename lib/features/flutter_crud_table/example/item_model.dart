
class Item {
  int id;
  String name;
  String email;

  Item({required this.id, required this.name, required this.email});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

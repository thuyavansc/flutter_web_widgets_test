
// api_service.dart
import '../data_table/data_table_controller.dart';
import 'item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiBaseUrl = 'http://localhost:3000/api';

Future<DataPage<Item>> fetchItems(int page, int itemsPerPage, String searchQuery) async {
  final response = await http.get(Uri.parse(
      'http://localhost:3000/api/items?page=$page&limit=$itemsPerPage&search=$searchQuery'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> itemsJson = data['items'];
    final int totalItems = data['totalItems'];

    List<Item> items = itemsJson.map((json) => Item.fromJson(json)).toList();

    return DataPage(items: items, totalItems: totalItems);
  } else {
    throw Exception('Failed to load items');
  }
}


// Create a new item
Future<void> apiCreateItem(Item item) async {
  final response = await http.post(
    Uri.parse('$apiBaseUrl/items'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'name': item.name, 'email': item.email}),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create item');
  }
}

// Update an existing item
Future<void> apiUpdateItem(Item item) async {
  final response = await http.put(
    Uri.parse('$apiBaseUrl/items/${item.id}'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'name': item.name, 'email': item.email}),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update item');
  }
}

// Delete an item
Future<void> apiDeleteItem(Item item) async {
  final response = await http.delete(Uri.parse('$apiBaseUrl/items/${item.id}'));
  if (response.statusCode != 200) {
    throw Exception('Failed to delete item');
  }
}

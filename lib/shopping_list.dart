import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopping/product.dart';

class ShoppingList {
  List<Product> items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    List jsonItems = data["items"];
    for (var i = 0; i < jsonItems.length; i++) {
      String name = jsonItems[i]["name"];
      String description = jsonItems[i]["description"];
      int count = jsonItems[i]["count"];
      add(Product(name, description, count));
    }
  }

  void add(Product item) {
    items.add(item);
  }

  void delete(int index) {
    items.removeAt(index);
  }
}

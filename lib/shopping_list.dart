import 'package:shopping/product.dart';

class ShoppingList {
  List<Product> items = [];

  void add(Product item) {
    this.items.add(item);
  }

  void delete(int index) {
    this.items.removeAt(index);
  }
}

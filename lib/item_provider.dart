import 'package:flutter/material.dart';

class Item {
  String title;
  String description;

  Item({required this.title, required this.description});
}

// State management using Provider
class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(
        title: "Rainforest Ecosystems",
        description:
            "Discover the rich biodiversity found in rainforests, from towering trees to unique wildlife species"),
  ];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}


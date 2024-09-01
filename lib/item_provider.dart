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
    Item(
        title: "Space Exploration",
        description:
            "Learn about humanity's journey to explore the cosmos, from the first moon landing to Mars missions"),
    Item(
        title: "Ancient Civilisations",
        description:
            "Explore the mysteries and achievements of ancient civilizations like the Egyptians, Greeks, and Mayans."),
    Item(
        title: "Renewable Energy",
        description:
            "Understand the importane of renewable energy sources like solar,wind and hydro power in combating climate change."),
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

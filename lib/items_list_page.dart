import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/add_items_pgae.dart';
import 'package:test_app/item_card.dart';
import 'package:test_app/item_provider.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Test App',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              label: const Text("New"),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 2, 36, 64)),
              ),
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddItemPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ItemCard(
                  item: item,
                  onDelete: () => itemProvider.removeItem(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

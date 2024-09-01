
import 'package:flutter/material.dart';
import 'package:test_app/item_provider.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;

  const ItemCard({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(
              item.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.delete_outlined, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            item.description,
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

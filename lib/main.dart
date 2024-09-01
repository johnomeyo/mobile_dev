import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/item_provider.dart';
import 'package:test_app/items_list_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 19),
        ),
      ),
      home: const ItemListPage(),
    );
  }
}

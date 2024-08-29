// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paginated Data Table App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemPage(),
    );
  }
}

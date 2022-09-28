import 'package:flutter/material.dart';
import 'ui/shoppingcart/index.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InThe Store',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ShoppingCartPage(),
    );
  }
}
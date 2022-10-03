import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/ui/catalog/index.dart';
import 'package:shopping_cart/ui/product_detail/index.dart';
import 'package:shopping_cart/ui/shoppingcart/index.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Product product = Product(
        id: '1',
        name: 'Shoe',
        description: 'This is a shoe',
        price: 129000,
        image: 'assets/shoe2.jpg');
    return MaterialApp(
      title: 'InThe Store',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/': (context) => const CatalogPage(),
        '/shopping_cart': (context) => const ShoppingCartPage(),
        '/product_detail': (context) => ProductDetailPage(
            product: ModalRoute.of(context)?.settings.arguments as Product),
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/ui/catalog/index.dart';
import 'package:shopping_cart/ui/checkout/index.dart';
import 'package:shopping_cart/ui/product_detail/index.dart';
import 'package:shopping_cart/ui/shoppingcart/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDuFoQEFJYiNXFE0W2qjnWZ9fTo-iIj95M',
          appId: '1:210885430998:web:f3be1baf43c2f1c4c14377',
          messagingSenderId: '210885430998',
          projectId: 'inthe-store-fe438'));

  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Product product = Product(
    //     id: '1',
    //     name: 'Shoe',
    //     description: 'This is a shoe',
    //     price: 129000,
    //     image: 'assets/shoe2.jpg');
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
        '/checkout':(context) => const CheckoutPage(),
      },
    );
  }
}

Future<List<Product>> getProductsFromFirebase() async {
  return FirebaseFirestore.instance
      .collection('products')
      .get()
      .then((QuerySnapshot q) {
    return List<Product>.generate(q.docs.length, (index) {
      DocumentSnapshot doc = q.docs[index];
      return Product(
          id: doc.id,
          name: doc['name'] as String,
          description: doc['description'] as String,
          price: doc['price'] as int,
          image: doc['image'] as String);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/main.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          ),
          title: const Text('Catalog'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shopping_cart');
              },
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Shopping Cart',
            ),
          ],
        ),
        body: FutureBuilder(
          future: getProductsFromFirebase(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'An Error Has Occured:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            }
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatalogProductCard(product: products[index]);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product_detail', arguments: product);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'RP${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 200),
                        child: TextButton.icon(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addToCart(product);
                            Navigator.pushNamed(context, '/shopping_cart');
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text('Add to Cart'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.tealAccent.shade700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

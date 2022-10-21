import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/product.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      Product(id: '1', name: 'Item 1', price: 10000, image: 'assets/shoe1.jpg'),
      Product(id: '2', name: 'Item 2', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '3', name: 'Item 3', price: 10000, image: 'assets/shoe3.jpg'),
      Product(id: '4', name: 'Item 4', price: 10000, image: 'assets/shoe1.jpg'),
      Product(id: '5', name: 'Item 5', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '6', name: 'Item 6', price: 10000, image: 'assets/shoe3.jpg'),
      Product(id: '7', name: 'Item 7', price: 10000, image: 'assets/shoe1.jpg'),
      Product(id: '8', name: 'Item 8', price: 10000, image: 'assets/shoe2.jpg'),
      Product(id: '9', name: 'Item 9', price: 10000, image: 'assets/shoe3.jpg'),
      Product(
          id: '10', name: 'Item 10', price: 10000, image: 'assets/shoe1.jpg'),
    ];
    // final List<String> items = [
    //   'Item 1',
    //   'Item 2',
    //   'Item 3',
    //   'Item 4',
    //   'Item 5',
    //   'Item 6',
    //   'Item 7',
    //   'Item 8',
    //   'Item 9',
    //   'Item 10',
    // ];
    // final List<int> prices = [
    //   10000,
    //   25000,
    //   100000,
    //   42000,
    //   77000,
    //   70000,
    //   11000,
    //   6000,
    //   149000,
    //   200000,
    // ];
    // final List<String> pictures = [
    //   'assets/shoe1.jpg',
    //   'assets/shoe2.jpg',
    //   'assets/shoe3.jpg',
    //   'assets/shoe1.jpg',
    //   'assets/shoe2.jpg',
    //   'assets/shoe3.jpg',
    //   'assets/shoe1.jpg',
    //   'assets/shoe2.jpg',
    //   'assets/shoe3.jpg',
    //   'assets/shoe1.jpg',
    //   'assets/shoe2.jpg',
    // ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
        ),
        title: const Text('Shopping Cart'),
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cart.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        cart.items[index].product.name,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      leading: Image.network(
                        items[index].image,
                        height: 56.0,
                        width: 56.0,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(
                        'Rp${cart.items[index].product.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ShoppingCartItemQty(
                      index: index,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      // ListView.builder(
      //     itemCount: items.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Card(
      //         child: ListTile(
      //           title: Text(items[index]),
      //           leading: Image.asset(
      //             pictures[index],
      //             height: 56.0,
      //             width: 56.0,
      //             fit: BoxFit.cover,
      //           ),
      //           subtitle: Text(
      //             'Rp${prices[index]}',
      //             style: const TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           trailing: IconButton(
      //             icon: const Icon(Icons.delete),
      //             onPressed: () {},
      //           ),
      //         ),
      //       );
      //     }),
      // ListView.builder(
      //     itemCount: items.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Container(
      //         color: Colors.teal.shade200,
      //         padding: const EdgeInsets.all(40.0),
      //         child: Text(items[index]),
      //       );
      //     }),
      // ListView(
      //   children: [
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 1'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 2'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 3'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 4'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 5'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 6'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 7'),
      //     ),
      //     Container(
      //       color: Colors.teal.shade200,
      //       padding: const EdgeInsets.all(40.0),
      //       child:  const Text('Item 8'),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: const ShoppingCartTotal(),
    );
  }
}

// ignore: must_be_immutable
class ShoppingCartItemQty extends StatelessWidget {
  const ShoppingCartItemQty({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeFromCart(index);
          },
          icon: const Icon(Icons.delete),
        ),
        // SizedBox(width: 12),
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).decItemQty(index);
          },
          icon: const Icon(Icons.remove),
        ),
        Selector<Cart, int>(
            builder: (BuildContext context, int qty, Widget? child) {
          return Text('$qty');
        }, selector: (BuildContext context, Cart cart) {
          return cart.items[index].qty;
        }),
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).incItemQty(index);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ShoppingCartTotal extends StatelessWidget {
  const ShoppingCartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.tealAccent.shade400),
      )),
      child: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListTile(
            title: const Text(
              'Total Price',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Rp${cart.totalPrice}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              child: TextButton(
                onPressed: cart.items.isNotEmpty
                    ? () {
                        Navigator.pushNamed(context, '/checkout');
                      }
                    : null,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: cart.items.isNotEmpty
                      ? Colors.tealAccent.shade700
                      : Colors.grey.shade400,
                ),
                child: const Text('Checkout'),
              ),
            ),
          );
        },
      ),
    );
  }
}

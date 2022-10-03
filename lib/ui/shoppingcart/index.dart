import 'package:flutter/material.dart';
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
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(items[index].name),
                    leading: Image.asset(
                      items[index].image,
                      height: 56.0,
                      width: 56.0,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Text(
                      'Rp${items[index].price}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ShoppingCartItemQty(),
                ],
              ),
            );
          }),
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
    );
  }
}

class ShoppingCartItemQty extends StatefulWidget {
  const ShoppingCartItemQty({Key? key}) : super(key: key);

  @override
  State<ShoppingCartItemQty> createState() => _ShoppingCartItemQtyState();
}

class _ShoppingCartItemQtyState extends State<ShoppingCartItemQty> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _qty = 1;
            });
          },
          icon: const Icon(Icons.delete),
        ),
        // SizedBox(width: 12),
        IconButton(
          onPressed: () {
            setState(() {
              if (_qty > 1) _qty--;
            });
          },
          icon: const Icon(Icons.remove),
        ),
        Text('$_qty'),
        IconButton(
          onPressed: () {
            setState(() {
              _qty++;
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

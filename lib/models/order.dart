import 'package:shopping_cart/models/cart.dart';

class Order {
  Order({
    this.name = '',
    this.contact = '',
    this.address = '',
    this.cart = const [],
  });
  String name;
  String contact;
  String address;
  List<CartItem> cart;
}

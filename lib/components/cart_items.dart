import 'package:flutter/material.dart';
import 'package:nike_app/models/cart.dart';
import 'package:nike_app/models/shoe.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItems extends StatefulWidget {
  Shoe shoe;
  CartItems({super.key, required this.shoe});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  // remove items from the cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 25),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          icon:const Icon(Icons.delete),
          onPressed: () => removeItemFromCart(),
        ),
      ),
    );
  }
}

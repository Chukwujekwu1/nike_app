import 'package:flutter/material.dart';
import 'package:nike_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of the shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '236',
      imagePath: 'lib/images/PngItem_40096.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'Air jordan',
      price: '200',
      imagePath: 'lib/images/PngItem_6808626.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'KD Treys',
      price: '250',
      imagePath: 'lib/images/PngItem_2897278.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '236',
      imagePath: 'lib/images/PngItem_2898429.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
  ];
  // List of items in user cart
  List<Shoe> userCart = [];

  // get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items to cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

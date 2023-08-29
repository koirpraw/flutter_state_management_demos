import 'package:flutter/material.dart';
import 'package:provider_shopping_cart/model/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _products = [
    Item(itemName: 'Bag', itemPrice: 125),
    Item(itemName: 'Hat', itemPrice: 25),
    Item(itemName: 'Belt', itemPrice: 20),
    Item(itemName: 'Slippers', itemPrice: 40),
    Item(itemName: 'Shirt', itemPrice: 35),
    Item(itemName: 'Sun Glasses', itemPrice: 165),
    Item(itemName: 'Water Bottle', itemPrice: 25),
    Item(itemName: 'Pen', itemPrice: 10),
    Item(itemName: 'Microphone', itemPrice: 65),
    Item(itemName: 'HeadPhone', itemPrice: 199),
  ];

  List<Item> get products => _products;

  void addItem(Item item) {
    _products.add(item);
    notifyListeners();
  }

  void removeItem() {}
}

import 'package:flutter/material.dart';

class ItemCountProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  remove() {
    _count--;
    notifyListeners();
  }
}

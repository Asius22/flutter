import 'dart:collection';

import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = <Item>[];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice {
    int total = 0;
    for (Item i in _items) {
      total += i.price;
    }
    return total;
  }

  void add(Item i) {
    _items.add(i);

    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class Item {
  Item({Key? key, required this.price});

  final int price;
}

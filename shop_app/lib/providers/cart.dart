import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (exitingItem) => CartItem(
            id: exitingItem.id,
            title: exitingItem.title,
            quantity: exitingItem.quantity + 1,
            price: exitingItem.price),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
  void removeSingleItem(String productID){
    if(!_items.containsKey(productID)){
      return;
    }
    var quantity = _items[productID]?.quantity;
    if( quantity! > 1){
      _items.update(
        productID,
            (exitingItem) => CartItem(
            id: exitingItem.id,
            title: exitingItem.title,
            quantity: exitingItem.quantity - 1,
            price: exitingItem.price),
      );
    }else{
      _items.remove(productID);
    }
    notifyListeners();
  }
}

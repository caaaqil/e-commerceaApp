import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in _cartItems) {
      // Ensure price is a valid double
      double price = item['price'] is String
          ? double.tryParse(item['price'].replaceAll('\$', '')) ?? 0.0
          : item['price'] is double
              ? item['price']
              : 0.0;
      total += price;
    }
    return total;
  }
}

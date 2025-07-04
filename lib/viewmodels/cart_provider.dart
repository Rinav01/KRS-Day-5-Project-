import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  CartProvider() {
    loadCart();
  }

  Map<String, CartItem> get items => {..._items};

  double get totalAmount => _items.values
      .fold(0.0, (sum, item) => sum + item.price * item.quantity);

  /// Add an item to the cart, or increase its quantity by [quantity].
  void addItem(String productId, String title, double price, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (item) => CartItem(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity + quantity,
        ),
      );
    } else {
      _items[productId] = CartItem(
        id: productId,
        title: title,
        price: price,
        quantity: quantity,
      );
    }
    notifyListeners();
    saveCart();
  }

  void decreaseItem(String productId) {
    if (!_items.containsKey(productId)) return;
    final current = _items[productId]!;
    if (current.quantity > 1) {
      _items.update(
        productId,
        (item) => CartItem(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
    saveCart();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
    saveCart();
  }

  void clear() {
    _items.clear();
    notifyListeners();
    saveCart();
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _items.map((key, item) => MapEntry(key, {
          'id': item.id,
          'title': item.title,
          'price': item.price,
          'quantity': item.quantity,
        }));
    prefs.setString('cartData', json.encode(data));
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('cartData')) return;

    try {
      final data = json.decode(prefs.getString('cartData')!) as Map<String, dynamic>;
      _items = data.map((key, item) => MapEntry(
            key,
            CartItem(
              id: item['id'],
              title: item['title'],
              price: (item['price'] as num).toDouble(),
              quantity: item['quantity'],
            ),
          ));
      notifyListeners();
    } catch (e) {
      // If decoding fails, clear the cart to avoid crashes
      _items = {};
      notifyListeners();
    }
  }
}

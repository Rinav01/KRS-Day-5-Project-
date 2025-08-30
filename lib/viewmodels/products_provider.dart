import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'T-Shirt',
      description: 'A comfortable cotton T-shirt',
      price: 20.0,
      imageUrl: 'https://picsum.photos/id/75/200/300', category: 'Clothes',
    ),
    Product(
      id: 'p2',
      title: 'Sneakers',
      description: 'Stylish running shoes',
      price: 60.0,
      imageUrl: 'https://picsum.photos/id/75/200/300', category: 'Shoes',
    ),
  ];

  List<Product> get items => [..._items];

  void toggleFavorite(String productId) {
    final index = _items.indexWhere((prod) => prod.id == productId);
    if (index != -1) {
      _items[index].isFavorite = !_items[index].isFavorite;
      notifyListeners();
    }
  }

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  Product findById(String id) => _items.firstWhere((prod) => prod.id == id);
}

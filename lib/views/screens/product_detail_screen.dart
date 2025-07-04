import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductsProvider>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          SizedBox(height: 10),
          Text(product.description),
          SizedBox(height: 10),
          Text('\$${product.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

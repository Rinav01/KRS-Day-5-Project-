import 'package:flutter/material.dart';
import 'package:krs_class_day5/viewmodels/products_provider.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../viewmodels/cart_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              productsProvider.toggleFavorite(product.id);
            },
          ),
          title: Text(product.title, textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async {
              int? selectedQty = await showDialog<int>(
                context: context,
                builder: (ctx) {
                  int qty = 1;
                  return AlertDialog(
                    title: Text('Select Quantity'),
                    content: StatefulBuilder(
                      builder: (ctx, setState) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: qty > 1
                                ? () => setState(() => qty--)
                                : null,
                          ),
                          Text(qty.toString(), style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => setState(() => qty++),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      ElevatedButton(
                        child: Text('Add'),
                        onPressed: () => Navigator.of(ctx).pop(qty),
                      ),
                    ],
                  );
                },
              );
              if (selectedQty != null) {
                Provider.of<CartProvider>(context, listen: false)
                    .addItem(product.id, product.title, product.price, selectedQty);
              }
            },
          ),
        ),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
        ),
      ),
    );
  }
}

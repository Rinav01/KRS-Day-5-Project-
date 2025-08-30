import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_provider.dart';
import 'order_summary_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items.values.toList();
    final keys = cart.items.keys.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(items[i].title),
                subtitle: Text(
                    'Total: \$${(items[i].price * items[i].quantity).toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => cart.decreaseItem(keys[i]),
                    ),
                    Text('${items[i].quantity}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => cart.addItem(keys[i], items[i].title, items[i].price, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('ORDER NOW'),
            onPressed: () {
              if (items.isNotEmpty) {
                Navigator.of(context).pushNamed(OrderSummaryScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}

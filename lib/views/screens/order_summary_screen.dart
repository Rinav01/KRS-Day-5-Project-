import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_provider.dart';

class OrderSummaryScreen extends StatelessWidget {
  static const routeName = '/order-summary';

  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thank you for your order!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(items[i].title),
                  trailing: Text('${items[i].quantity} x \$${items[i].price}'),
                ),
              ),
            ),
            Divider(),
            Text(
              'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text('Finish'),
                onPressed: () {
                  cart.clear();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

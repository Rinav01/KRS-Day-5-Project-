import 'package:flutter/material.dart';
import 'package:krs_class_day5/viewmodels/cart_provider.dart';
import 'package:krs_class_day5/viewmodels/theme_provider.dart';
import 'package:krs_class_day5/views/screens/cart_screen.dart';
import 'package:krs_class_day5/views/screens/order_summary_screen.dart';
import 'package:krs_class_day5/views/screens/product_detail_screen.dart';
import 'package:krs_class_day5/views/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

import 'viewmodels/products_provider.dart';
import 'theme.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping App',
          theme: customLightTheme,      // Use your custom light theme
          darkTheme: customDarkTheme,   // Use your custom dark theme
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
            CartScreen.routeName: (_) => CartScreen(),
            OrderSummaryScreen.routeName: (_) => OrderSummaryScreen(),
          },
        ),
      ),
    );
  }
}

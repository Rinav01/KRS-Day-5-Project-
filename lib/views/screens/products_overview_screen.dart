import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/products_provider.dart';
import '../../viewmodels/cart_provider.dart';
import '../../viewmodels/theme_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/product_item.dart';
import '../widgets/badge.dart' as custom;

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    List<String> categories = [
      'All',
      ...{...productsProvider.items.map((p) => p.category)}
    ];

    // Filter products by search, category, and favorites
    List products = productsProvider.items.where((product) {
      final matchesSearch = _searchQuery.isEmpty ||
          product.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' ||
          product.category == _selectedCategory;
      final matchesFavorite = !_showFavoritesOnly || product.isFavorite;
      return matchesSearch && matchesCategory && matchesFavorite;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(
              _showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            tooltip: _showFavoritesOnly ? 'Show All' : 'Show Favorites',
            onPressed: () {
              setState(() {
                _showFavoritesOnly = !_showFavoritesOnly;
              });
            },
          ),
          Consumer<CartProvider>(
            builder: (_, cart, ch) => custom.Badge(
              label: Text(cart.items.length.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (ctx, theme, _) => IconButton(
              icon: Icon(theme.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: theme.toggleTheme,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              // Category filter bar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((cat) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: _selectedCategory == cat,
                        onSelected: (_) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: products.isEmpty
          ? Center(child: Text('No products found.'))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (ctx, i) => ProductItem(products[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
    );
  }
}

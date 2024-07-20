import 'package:flutter/material.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:buy_smart/cart/ui/cart_screen.dart';
import 'package:buy_smart/product/ui/product_detail_screen.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.favorites.isEmpty) {
            return const Center(child: Text('No favorites found.'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productProvider.favorites.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.favorites[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text(product.description),
                          trailing: Text('\$${product.price}'),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final cartProvider = Provider.of<CartProvider>(context, listen: false);
                      for (var product in productProvider.favorites) {
                        cartProvider.addToCart(product);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                    child: const Text('Add all to Cart'),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

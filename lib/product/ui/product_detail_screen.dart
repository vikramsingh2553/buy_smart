import 'package:buy_smart/auth/ui/favorites_screen.dart';
import 'package:buy_smart/cart/ui/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buy_smart/product/model/product_model.dart';
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key,required this.product});
  final ProductModel product;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                          );
                        },
                        child: const Icon(Icons.favorite),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CartScreen()),
                          );
                        },
                        child: const Icon(Icons.shopping_cart),
                      ),
                      Text(cartProvider.cartItems.length.toString()),
                      const SizedBox(width: 16),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   product.imageUrl,
            //   width: double.infinity,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    bool isFavorite = productProvider.isFavorite(widget.product);
                    return GestureDetector(
                      onTap: () async {
                        if (isFavorite) {
                          await productProvider.addToFavorites(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to favorites!')),
                          );
                        } else {
                        await productProvider.removeFromFavorites(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Removed from favorites!')),

                          );
                        }
                      },
                      child: Icon(
                        isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(widget.product.description),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

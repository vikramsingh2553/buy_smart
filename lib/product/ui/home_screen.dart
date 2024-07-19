import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart/product/model/product_model.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:buy_smart/cart/ui/cart_screen.dart';
import 'package:buy_smart/product/ui/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Buy Smart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    GestureDetector( onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                        child: const Icon(Icons.shopping_cart)),
                    Text(cartProvider.cartItems.length.toString()),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.only(left: 86),
                    leading: Icon(Icons.location_on),
                    title: Text(
                      'Welcome to Buy Smart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for products...',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Exclusive Offer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildProductList(productProvider.products),
                  const SizedBox(height: 16),
                  const Text(
                    'Best Selling',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildProductList(productProvider.products),
                  const SizedBox(height: 16),
                  const Text(
                    'Groceries',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildProductList(productProvider.products),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Image.network(
                    //   product.imageUrl,
                    //   width: 72,
                    //   height: 80,
                    // ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.description),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('\$${product.price}'),
                        trailing: GestureDetector(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false).addToCart(product);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartScreen()),
                            );
                          },
                          child: const Icon(
                            Icons.add_box_rounded,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                  const ListTile(
                    title: Text('Special Offers'),
                    trailing: Text(
                      'See All',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productProvider.products.map((product) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  product.imageUrl,
                                  width: 72,
                                  height: 80,
                                ),
                                ListTile(
                                  title: Text(product.title),
                                  subtitle: Text(product.subtitle),
                                ),
                                ListTile(
                                  title: Text(product.price),
                                  trailing: const Icon(
                                    Icons.add_box_rounded,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

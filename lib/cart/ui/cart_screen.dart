import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:buy_smart/product/ui/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final double totalCost = cartProvider.cartItems.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text('\$${item.price}'),
            leading: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                cartProvider.deleteCartProduct(item);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return CheckoutScreen(totalCost: totalCost);
              },
            );
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}

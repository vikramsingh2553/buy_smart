import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalCost;

  const CheckoutScreen({super.key, required this.totalCost});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Delivery'),
                  trailing: TextButton(
                    onPressed: () {
                    },
                    child: const Text('Select Method'),
                  ),
                ),
                ListTile(
                  title: const Text('Payment'),
                  trailing: TextButton(
                    onPressed: () {

                    },
                    child: const Text('Select Payment'),
                  ),
                ),
                ListTile(
                  title: const Text('Promo Code'),
                  trailing: TextButton(
                    onPressed: () {
                    },
                    child: const Text('Pick Discount'),
                  ),
                ),
                ListTile(
                  title: const Text('Total Cost'),
                  trailing: Text('\$$totalCost'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Place an order you agree to our Terms and Conditions',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Place Order'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

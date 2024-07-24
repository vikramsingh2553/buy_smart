import 'package:buy_smart/product/shared/string_const.dart';
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
                  StringConst.checkout,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text(StringConst.delivery),
                  trailing: TextButton(
                    onPressed: () {
                    },
                    child: const Text(StringConst.selectMethod),
                  ),
                ),
                ListTile(
                  title: const Text(StringConst.payment),
                  trailing: TextButton(
                    onPressed: () {

                    },
                    child: const Text(StringConst.selectPayment),
                  ),
                ),
                ListTile(
                  title: const Text(StringConst.promoCode),
                  trailing: TextButton(
                    onPressed: () {
                    },
                    child: const Text(StringConst.pickDiscount),
                  ),
                ),
                ListTile(
                  title: const Text(StringConst.totalCost),
                  trailing: Text('\$$totalCost'),
                ),
                const SizedBox(height: 16),
                const Text(
                  StringConst.payTerms,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text(StringConst.placeOrder),
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

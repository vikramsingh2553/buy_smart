import 'package:buy_smart/product/shared/string_const.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = StringConst.card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.payment),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConst.paymentMethod,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio(
                  value: StringConst.card,
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text(StringConst.cardCapital),
                const SizedBox(width: 6,),
                Radio(
                  value: StringConst.upi,
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text(StringConst.upiCapital),
                const SizedBox(width: 4,),
                Radio(
                  value: StringConst.qr,
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text(StringConst.qrCode),
              ],
            ),
            const SizedBox(height: 16),
            _paymentMethod == StringConst.card
                ? const CardDetailsForm()
                : _paymentMethod == StringConst.upi
                ? const UPIForm()
                : const QRCodeForm(),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConst.totalAmount,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  StringConst.rupees,
                  style: TextStyle(fontSize: 18, color: Colors.redAccent),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Payment logic here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(StringConst.payNow),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailsForm extends StatelessWidget {
  const CardDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConst.cardDetails,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: StringConst.cardNumber,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 6,),
        TextFormField(
          decoration: const InputDecoration(
            labelText: StringConst.expiryDate,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 6,),

        TextFormField(
          decoration: const InputDecoration(
            labelText: StringConst.cvv,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

class UPIForm extends StatelessWidget {
  const UPIForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConst.upiDetails,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: StringConst.upiID,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}

class QRCodeForm extends StatelessWidget {
  const QRCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
           StringConst.qrCode,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Image.asset('assets/images/download (1).png'),
      ],
    );
  }
}
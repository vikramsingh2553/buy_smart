import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio(
                  value: 'card',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text('Card'),
                const SizedBox(width: 6,),
                Radio(
                  value: 'upi',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text('UPI'),
                const SizedBox(width: 4,),
                Radio(
                  value: 'qr',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
                const Text('QR Code'),
              ],
            ),
            const SizedBox(height: 16),
            _paymentMethod == 'card'
                ? const CardDetailsForm()
                : _paymentMethod == 'upi'
                ? const UPIForm()
                : const QRCodeForm(),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '\₹100.00',
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
              child: const Text('Pay Now'),
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
          'Card Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 6,),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Expiry Date',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 6,),

        TextFormField(
          decoration: const InputDecoration(
            labelText: 'CVV',
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
          'UPI Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'UPI ID',
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
          'QR Code',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Image.asset('assets/images/download (1).png'),
      ],
    );
  }
}
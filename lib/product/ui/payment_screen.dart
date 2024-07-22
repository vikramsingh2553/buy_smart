import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
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
                Text('Card'),
                SizedBox(width: 6,),
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
                Text('UPI'),
                SizedBox(width: 4,),
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
                Text('QR Code'),
              ],
            ),
            SizedBox(height: 16),
            _paymentMethod == 'card'
                ? CardDetailsForm()
                : _paymentMethod == 'upi'
                ? UPIForm()
                : QRCodeForm(),
            SizedBox(height: 16),
            Row(
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
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Payment logic here
              },
              child: Text('Pay Now'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 6,),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        SizedBox(height: 6,),

        TextFormField(
          decoration: InputDecoration(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UPI Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QR Code',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 8),
        Image.asset('assets/images/download (1).png'),
      ],
    );
  }
}
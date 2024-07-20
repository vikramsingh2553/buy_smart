
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:buy_smart/product/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/provider/auth_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Buy Smart',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

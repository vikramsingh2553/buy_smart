import 'package:buy_smart/auth/ui/welcome_screen.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/provider/user_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),      ],
      child: MaterialApp(
        title: 'Buy Smart',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}

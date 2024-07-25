import 'package:buy_smart/auth/ui/starting_home_screen.dart';
import 'package:buy_smart/cart/provider/cart_provider.dart';
import 'package:buy_smart/category/provider/category_provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: 'Buy Smart',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const StartingHomeScreen(),
      ),
    );
  }
}

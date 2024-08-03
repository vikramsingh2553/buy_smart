import 'package:buy_smart/auth/ui/starting_home_screen.dart';
import 'package:buy_smart/category/provider/category_provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:buy_smart/product/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ProductProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return CategoryProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: _checkFirstLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              bool isFirstLogin = snapshot.data ?? true;
              return isFirstLogin ? StartingHomeScreen() : HomeScreen();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  Future<bool> _checkFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLogin = prefs.getBool('isFirstLogin') ?? true;

    if (isFirstLogin) {
      await prefs.setBool('isFirstLogin', false);
    }

    return isFirstLogin;
  }
}

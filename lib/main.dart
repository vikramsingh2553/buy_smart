import 'package:buy_smart/category/provider/category_provider.dart';
import 'package:buy_smart/product/provider/product_provider.dart';
import 'package:buy_smart/product/ui/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          },),
          ChangeNotifierProvider(create: (context) {
            return CategoryProvider();
          },)
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ExploreScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
import 'package:buy_smart/auth/ui/favorites_screen.dart';
import 'package:buy_smart/cart/ui/cart_screen.dart';
import 'package:buy_smart/product/shared/string_const.dart';
import 'package:buy_smart/product/ui/explore_screen.dart';
import 'package:buy_smart/product/ui/home_screen.dart';
import 'package:buy_smart/product/ui/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingHomeScreen extends StatefulWidget {
  const StartingHomeScreen({super.key});

  @override
  State<StartingHomeScreen> createState() => _StartingHomeScreenState();
}

class _StartingHomeScreenState extends State<StartingHomeScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavoritesScreen(),
    const SettingScreen(),
  ];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label: StringConst.startNavigationShop,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_sharp),
            label: StringConst.startNavigationExplore,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: StringConst.startNavigationCart,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: StringConst.startNavigationFav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: StringConst.startNavigationAccount,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingHomeScreen extends StatefulWidget {
  const StartingHomeScreen({super.key});

  @override
  State<StartingHomeScreen> createState() => _StartingHomeScreenState();
}

class _StartingHomeScreenState extends State<StartingHomeScreen> {
  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

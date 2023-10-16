import 'package:cavcci_cafe/screens/home/SettingScreen.dart';
import 'package:cavcci_cafe/screens/home/favourite_tab.dart';
import 'package:cavcci_cafe/screens/home/homescreen.dart';
import 'package:cavcci_cafe/screens/home/shopscreen.dart';
import 'package:flutter/material.dart';

import '../../models/dummy_data.dart';
import '../../models/items.dart';

class TabScreen extends StatefulWidget {
  final List<Items> favourites;

  const TabScreen(this.favourites, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
  static const String routeName = 'HomeScreen';
}

class _TabScreenState extends State<TabScreen> {
  final List<Items> _favouriteItems = [];

  void _toggleFavourite(String itemId) {
    final existingIndex =
        _favouriteItems.indexWhere((item) => item.id == itemId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteItems.removeAt(existingIndex);
        print("_favouriteItems = $_favouriteItems");
      });
    } else {
      setState(() {
        _favouriteItems.add(dummyItems.firstWhere((item) => item.id == itemId));
        print("_favouriteItems = $_favouriteItems");
      });
    }
  }

  bool _isItemFavourite(String itemId) {
    return _favouriteItems.any((item) => item.id == itemId);
  }

  final List<Items> _availableItems = dummyItems;
  var selectedIndex = 0;
  List? items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      Home(
        _availableItems,
        _toggleFavourite,
        _isItemFavourite,
      ),
      FavouriteTab(_favouriteItems),
      const Cart(),
      const SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items![selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff353841),
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ''),
        ],
      ),
    );
  }
}

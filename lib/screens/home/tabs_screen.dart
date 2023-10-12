import 'package:cavcci_cafe/screens/home/SettingScreen.dart';
import 'package:cavcci_cafe/screens/home/favourite_tab.dart';
import 'package:cavcci_cafe/screens/home/homescreen.dart';
import 'package:cavcci_cafe/screens/home/shopscreen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  // var favourite;

  const TabScreen(
      // this.favourite
      {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
  static const String routeName = 'HomeScreen';
}

class _TabScreenState extends State<TabScreen> {
  var selectedIndex = 0;
  List? items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [const Home(), FavouriteTab(), const SettingScreen(), const cart()];
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
                size: 36,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 36,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 36,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 36,
              ),
              label: ''),
        ],
      ),
    );
  }
}

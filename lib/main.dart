import 'package:cavcci_cafe/models/dummy_data.dart';
import 'package:cavcci_cafe/screens/home/SettingScreen.dart';
import 'package:cavcci_cafe/screens/home/homescreen.dart';
import 'package:cavcci_cafe/screens/home/tabs_screen.dart';
import 'package:cavcci_cafe/screens/open/loginscreen.dart';
import 'package:cavcci_cafe/screens/open/resetpass.dart';
import 'package:cavcci_cafe/screens/open/signupscreen.dart';
import 'package:flutter/material.dart';

import 'models/items.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        _favouriteItems.add(
            dummyItems.firstWhere((item) => item.id == itemId));
        print("_favouriteItems = $_favouriteItems");
      });
    }
  }

  bool _isItemFavourite(String itemId) {
    return _favouriteItems.any((item) => item.id == itemId);
  }

  final List<Items> _availableItems = dummyItems;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabScreen(_favouriteItems),
      routes: {
        Loginscreen.routeName: (_) => const Loginscreen(),
        Signscreen.routeName: (_) => const Signscreen(),
        Resetpass.routeName: (_) => const Resetpass(),
        Home.routeName: (context) => Home(_availableItems,_toggleFavourite,_isItemFavourite,),
        TabScreen.routeName: (_) => TabScreen(_favouriteItems),
        SettingScreen.routeName: (_) => const SettingScreen(),
      },
    );
  }
}

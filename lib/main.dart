import 'package:cavcci_cafe/screens/home/homescreen.dart';
import 'package:cavcci_cafe/screens/home/tabs_screen.dart';
import 'package:cavcci_cafe/screens/open/loginscreen.dart';
import 'package:cavcci_cafe/screens/open/resetpass.dart';
import 'package:cavcci_cafe/screens/open/signupscreen.dart';
import 'package:cavcci_cafe/screens/open/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabScreen(),
      routes: {
        Loginscreen.routeName: (_) => const Loginscreen(),
        Signscreen.routeName: (_) => const Signscreen(),
        Resetpass.routeName: (_) => const Resetpass(),
        Home.routeName: (_) => const Home(),
        TabScreen.routeName: (_) => TabScreen(),
      },
    );
  }
}

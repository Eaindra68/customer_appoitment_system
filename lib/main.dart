import 'package:ace_customer_appoitment_system/config/my_theme.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/bottom_nav_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      title: 'Material App',
      home: BottomNavPage(),
    );
  }
}

import 'package:ace_customer_appoitment_system/config/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/pages/bottom_nav_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('customersBox');
  runApp(const MyApp());
}

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

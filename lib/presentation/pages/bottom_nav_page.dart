import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/about_us_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/contact_us_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentPageIndex = 0;
  final List<Widget> _pages = [HomePage(), ContactUsPage(), AboutUsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        surfaceTintColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: ColorConst.primary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Contact us', // fixed
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            label: 'About Us', // fixed
          ),
        ],
      ),
      body: IndexedStack(index: currentPageIndex, children: _pages),
    );
  }
}

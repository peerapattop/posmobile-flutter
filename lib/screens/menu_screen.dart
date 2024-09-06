import 'package:flutter/material.dart';
import 'package:posmobile/screens/Report/report_screen.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'Cart/cart_screen.dart';
import 'Home/home_screen.dart';
import 'Setting/setting_screen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _HomeState();
}

class _HomeState extends State<Menu> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Cart(),
    Report(),
    Setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

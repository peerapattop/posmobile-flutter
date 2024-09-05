import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        NavigationDestination(
          icon: Icon(Iconsax.home, color: currentIndex == 0 ? Colors.purple : Colors.grey),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.shopping_cart, color: currentIndex == 1 ? Colors.purple : Colors.grey),
          label: "Cart",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.receipt, color: currentIndex == 2 ? Colors.purple : Colors.grey),
          label: "Report",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.setting, color: currentIndex == 3 ? Colors.purple : Colors.grey),
          label: "Setting",
        ),
      ],
    );
  }
}
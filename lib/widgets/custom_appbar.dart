import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final Color backgroundColor;
  final double toolbarHeight;
  final VoidCallback? onIconPressed;

  const CustomAppbar({
    Key? key,
    required this.title,
    this.icon,
    required this.backgroundColor,
    required this.toolbarHeight,
    this.onIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(icon, color: Colors.white, size: 28),
              onPressed: onIconPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
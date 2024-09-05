import 'package:flutter/material.dart';
import 'package:posmobile/widgets/custom_appbar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Cart",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 100,
        onIconPressed: () {  },
      ),
    );
  }
}

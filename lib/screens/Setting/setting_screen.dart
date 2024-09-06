import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        mainAxisAlignment: MainAxisAlignment.center,
        title: "ตั้งค่า",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
      ),
      body: Column(
        children: [

        ],
      )
    );
  }
}

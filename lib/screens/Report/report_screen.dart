import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        mainAxisAlignment: MainAxisAlignment.center,
        title: "สรุปยอดขาย",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
      ),
      body: Text("data"),
    );
  }
}

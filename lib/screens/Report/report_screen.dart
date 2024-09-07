import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  // กำหนดค่าตัวเลือกใน dropdown
  List<String> items = ['วันนี้', 'สัปดาห์นี้', 'เดือนนี้'];

  // กำหนดสถานะเริ่มต้น
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // ตั้งค่าเริ่มต้นเป็นตัวเลือกแรกในรายการ
    selectedValue = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        mainAxisAlignment: MainAxisAlignment.center,
        title: "สรุปยอดขาย",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pie Chart'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 130,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue,
                      isExpanded: true,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 200),
          ],
        ),
      ),
    );
  }
}

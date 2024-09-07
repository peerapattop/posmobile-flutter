import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<String> items = ['วันนี้', 'สัปดาห์นี้', 'เดือนนี้'];

  String? selectedValue;

  bool isOlder = true;

  void toggleText() {
    setState(() {
      isOlder = !isOlder;
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 300),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "รายการย้อนหลัง",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleText,
                    child: Row(
                      children: [
                        Text(
                          isOlder ? "เก่ากว่า" : "ใหม่กว่า",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          isOlder ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // เมื่อกด Container จะแสดงหน้าจอ Alert
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("รายละเอียดสลิป"),
                        content: Text("นี่คือรายละเอียดสลิปของคุณ."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // ปิดหน้าจอแจ้งเตือน
                            },
                            child: Text("ปิด"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 100.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("กระเพรา, ไข่ดาว x 2",
                              style: TextStyle(fontSize: 17)),
                          Text("9 กันยายน 2567 - 21:28",
                              style: TextStyle(fontSize: 17)),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(''),
                          Text(
                            '20.00 บาท',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("กระเพรา, ไข่ดาว x 2",
                            style: TextStyle(fontSize: 17)),
                        Text("9 กันยายน 2567 - 21:28",
                            style: TextStyle(fontSize: 17))
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        Text(
                          '20.00 บาท',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("กระเพรา, ไข่ดาว x 2",
                            style: TextStyle(fontSize: 17)),
                        Text("9 กันยายน 2567 - 21:28",
                            style: TextStyle(fontSize: 17))
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        Text(
                          '20.00 บาท',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

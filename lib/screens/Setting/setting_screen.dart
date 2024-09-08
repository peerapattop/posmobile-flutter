import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        mainAxisAlignment: MainAxisAlignment.center,
        title: "ตั้งค่า",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('จัดการพนักงาน', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดจัดการโปรไฟล์
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('จัดการเมนู', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดจัดการโปรไฟล์
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('จัดการพประเภทเมนู', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดจัดการโปรไฟล์
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('จัดการโปรไฟล์', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดจัดการโปรไฟล์
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.deepPurple),
            title: const Text('เปลี่ยนรหัสผ่าน', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดเปลี่ยนรหัสผ่าน
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('จัดการ Pin', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดจัดการโปรไฟล์
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.deepPurple),
            title: const Text('การแจ้งเตือน', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดการแจ้งเตือน
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.deepPurple),
            title: const Text('ออกจากระบบ', style: TextStyle(fontSize: 18)),
            onTap: () {
              // เพิ่มฟังก์ชันเมื่อกดออกจากระบบ
            },
          ),
          Text("เวอร์ชั่น 1.0.0")
        ],
      ),
    );
  }
}

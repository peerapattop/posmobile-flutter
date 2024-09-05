import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String? imageUrl;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "สวัสดี คุณพีรพัฒน์ !",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //ช่องค้นหา
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            //รายการอาหาร
            
          ]
        ),
      )
    );
  }
}

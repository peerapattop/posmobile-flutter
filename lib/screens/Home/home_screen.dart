import 'package:flutter/material.dart';
import '../../widgets/custom_alert.dart';
import '../../widgets/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 30) / 2; // ความกว้างของการ์ดในกริด

    return Scaffold(
      appBar: CustomAppbar(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        title: "สวัสดี คุณพีรพัฒน์ !",
        icon: Icons.logout,
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 140,
        onIconPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlert(
                title: 'ออกจากระบบ',
                content: 'คุณต้องการออกจากระบบหรือไม่?',
                onConfirm: () {
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ช่องค้นหา
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
            // รายการชนิด
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    {'icon': 'grid.png', 'label': 'ALL', 'color': Colors.deepPurple, 'textColor': Colors.white},
                    {'icon': 'rice.png', 'label': 'Rice', 'color': Colors.white, 'textColor': Colors.deepPurple},
                    {'icon': 'soda.png', 'label': 'Water', 'color': Colors.white, 'textColor': Colors.deepPurple},
                    {'icon': 'add.png', 'label': 'Add', 'color': Colors.white, 'textColor': Colors.deepPurple}
                  ].map((item) {
                    Color cardColor = item['color'] as Color? ?? Colors.white;
                    Color textColor = item['textColor'] as Color? ?? Colors.black;
                    String label = item['label'] as String? ?? '';

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 100,
                        height: 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: item['label'] == 'Add'
                                ? const BorderSide(color: Colors.deepPurple, width: 0.9)
                                : BorderSide.none,
                          ),
                          color: cardColor,
                          margin: const EdgeInsets.only(top: 20, left: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  "assets/icons/${item['icon']}",
                                  color: textColor,
                                  scale: 15,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  label,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Divider(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 20, left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Image.asset("assets/images/kapao.jpg", scale: 7),
                          const Text(
                            "กระเพรา",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '60 บาท',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepPurple,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:posmobile/screens/login_screen.dart';

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
            //รายการชนิด
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 140,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.deepPurple,
                      margin: const EdgeInsets.only(top: 20, left: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 7),
                            Image.asset(
                              "assets/icons/grid.png",
                              color: Colors.white,
                              scale: 19,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'ALL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 140,
                    child: Card(
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
                            Image.asset(
                              "assets/icons/rice.png",
                              color: Colors.deepPurple,
                              scale: 13,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Rice',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 140,
                    child: Card(
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
                            Image.asset(
                              "assets/icons/soda.png",
                              color: Colors.deepPurple,
                              scale: 13,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Water',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 140,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: Colors.deepPurple,
                          width: 0.9,
                        ),
                      ),
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 20, left: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              "assets/icons/add.png",
                              color: Colors.deepPurple,
                              scale: 13,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                                color: Colors.deepPurple),
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

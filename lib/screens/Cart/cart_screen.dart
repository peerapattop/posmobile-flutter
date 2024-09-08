import 'package:flutter/material.dart';
import 'package:posmobile/screens/Cart/result_screen.dart';
import 'package:posmobile/widgets/custom_appbar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isCashSelected = true;  // สถานะสำหรับติดตามการเลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "รถเข็น",
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "ทั้งหมด 10 รายการ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 10),
            child: SizedBox(
              width: double.infinity,
              height: 160,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
                margin: const EdgeInsets.only(top: 20, left: 5),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/icons/soda.png",
                              fit: BoxFit.cover,
                              width: 80.0,
                              height: 95.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ชานมไข่มุก",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "50 บาท",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 80),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              SizedBox(width: 70),
                              Icon(Icons.delete,color: Colors.red),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepPurple,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCashSelected = true;  // เลือก "เงินสด"
                  });
                },
                child: Container(
                  height: 70,
                  width: 190,
                  decoration: BoxDecoration(
                    color: isCashSelected ? Colors.deepPurple : Colors.white,  // เปลี่ยนสีตามสถานะการเลือก
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'เงินสด',
                      style: TextStyle(
                        fontSize: 18,
                        color: isCashSelected ? Colors.white : Colors.black,  // เปลี่ยนสีข้อความตามการเลือก
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCashSelected = false;  // เลือก "ชำระเงินออนไลน์"
                  });
                },
                child: Container(
                  height: 70,
                  width: 190,
                  decoration: BoxDecoration(
                    color: !isCashSelected ? Colors.deepPurple : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ชำระเงินออนไลน์',
                      style: TextStyle(
                        fontSize: 18,
                        color: !isCashSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Result(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.deepPurple,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20,right: 30,top: 5,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ทั้งหมด 250 บาท",style: TextStyle(color: Colors.white,fontSize: 20)),
                    Row(
                      children: [
                        Text(
                          'ชำระเงิน',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

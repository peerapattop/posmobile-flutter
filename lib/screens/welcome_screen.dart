import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posmobile/screens/signup_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WELCOME TO POS',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  height: size.height * 0.45,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: CustomButton(
                    text: 'LOGIN',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: CustomButton(
                    backgroundColor: const Color(0xFFF7DCF9),
                    textColor: Colors.black,
                    text: 'SIGNUP',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}

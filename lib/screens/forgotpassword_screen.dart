import 'package:flutter/material.dart';
import 'package:posmobile/screens/login_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
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
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'RESET PASSWORD',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  Image.asset("assets/icons/forgotPassword.jpg"),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      prefixIcon: Icons.person,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, bottom: 10),
                    child: CustomButton(
                      text: 'Reset Password',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

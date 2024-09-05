import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posmobile/screens/forgotpassword_screen.dart';
import 'package:posmobile/screens/menu_screen.dart';
import 'package:posmobile/screens/signup_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset("assets/icons/login.svg",
                      height: size.height * 0.35),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      prefixIcon: Icons.person,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    child: CustomInput(
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      hintText: 'Password',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 40, left: 40, top: 25, bottom: 10),
                    child: CustomButton(
                      text: 'LOGIN',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Menu(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'ลืมรหัสผ่าน',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have Account ?",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

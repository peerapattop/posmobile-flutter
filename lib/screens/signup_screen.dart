import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posmobile/screens/login_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterState();
}

class _RegisterState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/signup_top.png",
                  width: size.width * 0.35,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/signup.svg",
                      height: size.height * 0.35),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      prefixIcon: Icons.person,
                      hintText: 'FullName',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      prefixIcon: Icons.email,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40,bottom: 25),
                    child: CustomInput(
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    child: CustomInput(
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 40, left: 40, top: 25, bottom: 10),
                    child: CustomButton(
                      text: 'SIGNUP',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

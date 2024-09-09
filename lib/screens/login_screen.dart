import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posmobile/screens/forgotpassword_screen.dart';
import 'package:posmobile/screens/menu_screen.dart';
import 'package:posmobile/screens/signup_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../services/api_service.dart';
import '../services/login_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/snack_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late LoginService _loginService;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService('http://192.168.1.137:3000/api');
    _loginService = LoginService(apiService);
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final data = {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      };

      try {
        final result = await _loginService.login(data);

        if (result['success'] == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Menu()),
          );
        } else {
          CustomSnackBar.show(
            context,
            title: 'Login Failed',
            message: result['message'] ?? 'Unknown error occurred',
            contentType: ContentType.failure,
          );
        }
      } catch (e) {
        // จัดการข้อผิดพลาดของการเชื่อมต่อ API
        CustomSnackBar.show(
          context,
          title: 'Login Failed',
          message: 'An error occurred. Please try again later.',
          contentType: ContentType.failure,
        );
      }
    }
  }

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
              Form(
                key: _formKey,
                child: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 40, bottom: 25),
                      child: CustomInput(
                        controller: _emailController,
                        prefixIcon: Icons.person,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 40),
                      child: CustomInput(
                        controller: _passwordController,
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        hintText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, top: 25, bottom: 10),
                      child: CustomButton(
                        text: 'LOGIN',
                        onPressed: _login,
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
                              'Forgot Password?',
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
                          "Don't have an account?",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/api_service.dart';
import '../services/signup_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/snack_bar.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterState();
}

class _RegisterState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  late String _fullNameError = '';
  late String _emailError = '';
  late String _passwordError = '';
  late String _confirmPasswordError = '';

  late SignupService _registrationService;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService('http://192.168.1.137:3000/api');
    _registrationService = SignupService(apiService);
  }

  void _register() async {
    setState(() {
      _fullNameError = '';
      _emailError = '';
      _passwordError = '';
      _confirmPasswordError = '';
    });

    bool hasError = false;

    if (_fullNameController.text.trim().isEmpty) {
      setState(() {
        _fullNameError = 'Please enter your full name';
      });
      hasError = true;
    }
    if (_emailController.text.trim().isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
      hasError = true;
    }
    if (_passwordController.text.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters';
      });
      hasError = true;
    }
    if (_confirmPasswordController.text != _passwordController.text) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
      });
      hasError = true;
    }

    if (hasError) {
      print('Validation failed');
      return;
    }

    final data = {
      'fullName': _fullNameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    try {
      await _registrationService.register(data);
      CustomSnackBar.show(
        context,
        title: 'Successfully!!',
        message: 'Create Account Successfully!',
        contentType: ContentType.success,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
              Form(
                key: _formKey,
                child: Column(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomInput(
                            controller: _fullNameController,
                            prefixIcon: Icons.person,
                            hintText: 'Full Name',
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  _fullNameError.isNotEmpty) {
                                setState(() {
                                  _fullNameError = '';
                                });
                              }
                            },
                          ),
                          if (_fullNameError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                _fullNameError,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          const SizedBox(height: 15), // ระยะห่างระหว่างฟิลด์
                          CustomInput(
                            controller: _emailController,
                            prefixIcon: Icons.email,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              if (value.isNotEmpty && _emailError.isNotEmpty) {
                                setState(() {
                                  _emailError = '';
                                });
                              }
                            },
                          ),
                          if (_emailError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                _emailError,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          const SizedBox(height: 15), // ระยะห่างระหว่างฟิลด์
                          CustomInput(
                            controller: _passwordController,
                            obscureText: true,
                            prefixIcon: Icons.lock,
                            suffixIcon: Icons.visibility,
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  _passwordError.isNotEmpty) {
                                setState(() {
                                  _passwordError = '';
                                });
                              }
                            },
                          ),
                          if (_passwordError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                _passwordError,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          const SizedBox(height: 15), // ระยะห่างระหว่างฟิลด์
                          CustomInput(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            prefixIcon: Icons.lock,
                            suffixIcon: Icons.visibility,
                            hintText: 'Confirm Password',
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              // ตรวจสอบว่า password และ confirm password ตรงกันหรือไม่
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                setState(() {
                                  _confirmPasswordError =
                                      'Passwords do not match';
                                });
                              } else {
                                setState(() {
                                  _confirmPasswordError = '';
                                });
                              }
                            },
                          ),
                          if (_confirmPasswordError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                _confirmPasswordError,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, top: 25, bottom: 10),
                      child: CustomButton(
                        text: 'SIGNUP',
                        onPressed: () {
                          _register();
                        },
                      ),
                    ),
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

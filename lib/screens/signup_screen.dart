import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/api_service.dart';
import '../services/signup_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _RegisterState();
}

class _RegisterState extends State<SignUp> {
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  late SignupService _registrationService;
  @override
  void initState() {
    super.initState();
    final apiService = ApiService('http://192.168.1.137:3000/api');
    _registrationService = SignupService(apiService);
  }

  void _register() async {
    final fullName = _fullNameController.text.trim();
    final password = _passwordController.text.trim();
    final email = _emailController.text.trim();

    if (fullName.isEmpty || password.isEmpty || email.isEmpty) {
      print('Please fill in all fields.');
      return;
    }
    final data = {
      'fullName': fullName,
      'password': password,
      'email': email,
    };

    try {
      final result = await _registrationService.register(data);
      // จัดการผลลัพธ์ที่ได้รับ
      print('Registration successful: $result');
      // คุณสามารถแสดงข้อความแจ้งเตือนหรือเปลี่ยนเส้นทางผู้ใช้ที่นี่
    } catch (e) {
      // จัดการข้อผิดพลาด
      print('Error: $e');
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
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      controller: _fullNameController,
                      prefixIcon: Icons.person,
                      hintText: 'FullName',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40, bottom: 25),
                    child: CustomInput(
                      controller: _emailController,
                      prefixIcon: Icons.email,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40,bottom: 25),
                    child: CustomInput(
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                 Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: CustomInput(
                      controller: _passwordController,
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
                        _register();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Login(),
                        //   ),
                        // );
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

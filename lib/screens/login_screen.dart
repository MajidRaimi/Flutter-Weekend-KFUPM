import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iau_flutter_weekend/screens/widgets/email_text_field.dart';
import 'package:iau_flutter_weekend/screens/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Lottie.asset('assets/animations/signup.json'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login to continue',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      EmailTextField(
                          text: 'Email', controller: _emailController),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(
                        text: 'Password',
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        text: 'Login',
                        onTap: () {
                          print(_passwordController.text);
                        },
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

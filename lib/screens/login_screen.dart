import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iau_flutter_weekend/screens/home_screen.dart';
import 'package:iau_flutter_weekend/screens/widgets/email_text_field.dart';
import 'package:iau_flutter_weekend/screens/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import 'signup_screen.dart';
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  padding: const EdgeInsets.all(48),
                  child: SvgPicture.asset('assets/images/login.svg'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    EmailTextField(text: 'Email', controller: _emailController),
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
                        // TODO : login with email and password
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                        print(_passwordController.text);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("don't have account ?"),
                        TextButton(
                          child: const Text("Create account"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpScreen();
                                },
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

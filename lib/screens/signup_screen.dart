import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iau_flutter_weekend/screens/widgets/email_text_field.dart';
import 'package:iau_flutter_weekend/screens/widgets/password_text_field.dart';

import '../constants/colors.dart';
import 'on_boarding_screen.dart';
import 'widgets/main_button.dart';
import 'widgets/name_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kBlueColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset('assets/images/signup.svg'),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: SizedBox(
                    width: 330,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NameTextField(
                                text: 'first name',
                                controller: _firstNameController,
                              ),
                              NameTextField(
                                text: 'last name',
                                controller: _lastNameController,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          EmailTextField(
                            text: 'email',
                            controller: _emailController,
                          ),
                          const SizedBox(height: 16),
                          PasswordTextField(
                            text: 'password',
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 16),
                          MainButton(
                              text: 'Register',
                              onTap: () {
                                // TODO : Signup Method
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingScreen(),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
    ;
  }
}

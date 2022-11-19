import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      child: TextFormField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          iconColor: kDarkBlueColor,
          prefixIcon: const Icon(
            Icons.password,
          ),
          border: const OutlineInputBorder(),
          labelText: text,
        ),
        // Validate Password
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          // Regex for strong password
          final RegExp nameExp = RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
          );
          // Validate
          if (!nameExp.hasMatch(value)) {
            return 'Password must contain at least:\n- One uppercase letter \n- One lowercase letter \n- One number \n- One special character';
          }
          return null;
        },
      ),
    );
  }
}

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
          border : const OutlineInputBorder() , 
          labelText: text,
        ),

      ),
    );
  }
}

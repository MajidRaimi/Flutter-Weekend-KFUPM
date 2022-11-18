import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
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
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
          ),
          focusColor: kDarkBlueColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kDarkBlueColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}

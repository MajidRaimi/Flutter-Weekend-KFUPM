import 'package:flutter/material.dart';

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
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
          ),
          border: const OutlineInputBorder(),
          labelText: text,
        ),
        // Validate email using regex
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          final RegExp nameExp = RegExp(
            r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
          );
          if (!nameExp.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}

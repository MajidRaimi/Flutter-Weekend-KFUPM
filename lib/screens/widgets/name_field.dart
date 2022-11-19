import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
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
      width: width * 0.39,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border : const OutlineInputBorder() , 
          labelText: text,
        ),
      ),
    );
  }
}

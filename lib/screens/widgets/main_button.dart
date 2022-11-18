import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.45,
        decoration: BoxDecoration(
            color: kDarkBlueColor, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                  color: kWhiteColor, fontSize: 24, fontFamily: 'Space'),
            ),
          ),
        ),
      ),
    );
  }
}

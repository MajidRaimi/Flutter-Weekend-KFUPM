import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body:
      SafeArea(
        child: Center(
          child:Column(children: [
            Hero(
                    tag:"globe",
                    child: Lottie.asset('assets/animations/gloab_map.json',
                        width: 300, height: 300),
                  ),
          ]
          ,) 
          ),
          )
      ),
    );
  }
}
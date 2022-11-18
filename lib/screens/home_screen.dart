import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:iau_flutter_weekend/screens/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.person, color: kWhiteColor),
            Icon(Icons.home, color: kWhiteColor),
            Icon(Icons.help, color: kWhiteColor)
          ],
          activeIndex: 1,
          circleWidth: 60,
          color: kDarkBlueColor,
          height: 60,
          inactiveIcons: const [
            Text(
              "Profile",
              style: TextStyle(color: Colors.white,
              fontFamily: 'Space'),
            ),
            Text(
              "Home",
              style: TextStyle(color: Colors.white,
              fontFamily: 'Space'),
            ),
            Text(
              "Help",
              style: TextStyle(color: Colors.white,
              fontFamily: 'Space'),
            )
          ],
          shadowColor: kDarkBlueColor,
          elevation: 10,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                    tag: "globe",
                    child: Lottie.asset('assets/animations/gloab_map.json',
                        width: 300, height: 300),
                  ),
                  SizedBox(
                    height: 250

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MainButton(
                          text: "Let's Go!",
                          onTap: () {
                            print("it's working");
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      MainButton(text: "Find me another", onTap: () {

                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

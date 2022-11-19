import 'package:flutter/material.dart';
import 'package:iau_flutter_weekend/screens/widgets/location_suggestion.dart';
import 'package:lottie/lottie.dart';

import 'widgets/main_button.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 6,
              // child: Lottie.asset(
              //   'assets/animations/globe.json',
              // ),
              child: LocationSuggestion(
                locationName: 'The IDK',
                location: 'Turkey',
                imageLink:
                    'https://media.cntraveler.com/photos/5c2140fbe223c55afc3e41c7/3:4/w_1953,h_2604,c_limit/Galata_Istanbul_GettyImages-979437472.jpg',
                tag: '112233',
                information:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MainButton(
                          text: 'Another',
                          onTap: () {},
                          disabled: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MainButton(
                          text: 'I LIKE!',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

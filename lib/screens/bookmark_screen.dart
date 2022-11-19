import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iau_flutter_weekend/constants/colors.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'login_screen.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Future<void> _handleRefresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    void toLoginScreen(context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }

    // get the height of the Screen
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              toLoginScreen(context);
            },
            icon: const Icon(Icons.logout, color: kBlueColor),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Bookmark',
          style: TextStyle(
              color: kBlueColor,
              fontFamily: 'Space',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LiquidPullToRefresh(
            height: height * 0.5,
            onRefresh: _handleRefresh,
            child: ListView(
              children: [EmptyBookmark()],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyBookmark extends StatelessWidget {
  const EmptyBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 20),
        Text(
          'No bookmarked items',
          style: TextStyle(
              color: kBlueColor,
              fontFamily: 'Space',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'You can bookmark items by clicking the bookmark icon on the item',
          style: TextStyle(
              color: kBlueColor,
              fontFamily: 'Space',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

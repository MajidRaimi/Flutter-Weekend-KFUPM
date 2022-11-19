import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';

import '../constants/colors.dart';
import 'bookmark_screen.dart';
import 'like_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {
      CollectionsRequests.currentUser = FirebaseAuth.instance.currentUser;
    });
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: kWhiteColor),
          Icon(Icons.person, color: kWhiteColor),
        ],
        inactiveIcons: const [
          Icon(Icons.home, color: kWhiteColor),
          Icon(Icons.person, color: kWhiteColor),
        ],
        color: kBlueColor,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTab: (v) {
          tabIndex = v;
          pageController.jumpToPage(tabIndex);
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          const LikeScreen(),
          BookmarkScreen(),
        ],
      ),
    );
  }
}

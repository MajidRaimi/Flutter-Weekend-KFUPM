import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../model/bookmark_model.dart';
import 'bookmark_screen.dart';
import 'like_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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

  final locationsFutureProvider = FutureProvider<List<Bookmark>>((ref) async {
    final locations = await CollectionsRequests().getLocations();

    List<Bookmark> locationList = [];

    for (dynamic bookmark in locations) {
      locationList.add(Bookmark(
        bookmark["locationName"],
        bookmark["tag"],
        bookmark["imageLink"],
        bookmark["location"],
        bookmark["information"],
      ));
    }
    print(locationList);
    return locationList;
  });

  @override
  Widget build(BuildContext context) {
    final locationsRef = ref.watch(locationsFutureProvider);

    return locationsRef.when(data: (data) {
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
          children:  [
            LikeScreen(
              locations: data,
            ),
            BookmarkScreen(),
          ],
        ),
      );
    }, error: (error, stackTree) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return Scaffold(
        body: Center(
          child: Lottie.asset('assets/animations/globe.json'),
        ),
      );
    });
  }
}

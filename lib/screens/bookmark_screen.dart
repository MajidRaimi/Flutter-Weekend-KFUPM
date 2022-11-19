import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iau_flutter_weekend/constants/colors.dart';
import 'package:iau_flutter_weekend/hooks/BookmarkProvider.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

import '../model/bookmark_model.dart';
import 'login_screen.dart';

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  CollectionsRequests collections = CollectionsRequests();
  Future<void> _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    List<Bookmark> bookmarks = ref.watch(BookmarksProvider);
    final double height = MediaQuery.of(context).size.height;

    void toLoginScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              setState(() {
                CollectionsRequests.currentUser = null;
              });
              toLoginScreen();
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
              children: bookmarks.isEmpty
                  ? const [EmptyBookmark()]
                  : [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Lottie.asset(
                            'assets/animations/globe.json',
                            height: 200,
                            width: 200,
                          ),
                          // Show all user information from a list of users
                          SizedBox(
                            height: height * 0.5,
                            child: ListView.builder(
                              itemCount: bookmarks.length,
                              itemBuilder: (BuildContext context, int index) {
                                var bookmark = bookmarks[index];
                                return ListTile(
                                    title: Text(bookmark.locationName),
                                    subtitle: Text(bookmark.location),
                                    trailing: ElevatedButton(child: Icon(Icons.delete) ,onPressed: (){
                                      ref.read(BookmarksProvider.notifier).removeBookmark(bookmark.tag);
                                      collections.removeBookmark(bookmark.locationName);

                                    },),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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

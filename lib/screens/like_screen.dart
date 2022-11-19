import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iau_flutter_weekend/hooks/BookmarkFuture.dart';
import 'package:iau_flutter_weekend/screens/widgets/location_suggestion.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';
import 'package:lottie/lottie.dart';
import '../hooks/BookmarkProvider.dart';
import '../model/bookmark_model.dart';
import 'widgets/main_button.dart';

class LikeScreen extends ConsumerStatefulWidget {
  const LikeScreen({super.key, required this.locations});

  final List<Bookmark> locations;

  @override
  ConsumerState<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends ConsumerState<LikeScreen> {
  int index = 0;

  void changeCard() {
    setState(() {
      if (index < widget.locations.length - 1) {
        index = index + 1;
      }

      if (index == widget.locations.length - 1) {
        index = 0;
      }
    });
  }

 
  @override
  Widget build(BuildContext context) {
    final bookmarks = ref.watch(bookmarkProvider);
    final collections = CollectionsRequests();
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              // child: Lottie.asset(
              //   'assets/animations/globe.json',
              // ),
              child: LocationSuggestion(
                locationName: widget.locations[index].locationName,
                location: widget.locations[index].location,
                imageLink: widget.locations[index].imageLink,
                tag: widget.locations[index].tag,
                information: widget.locations[index].information,
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
                          onTap: changeCard,
                          disabled: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MainButton(
                          text: 'I LIKE!',
                          onTap: () {
                            ref
                                .read(BookmarksProvider.notifier)
                                .addBookmark(widget.locations[index]);
                                collections.addBookmark(widget.locations[index]);
                                changeCard();

                          },
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

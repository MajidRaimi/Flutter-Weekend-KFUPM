import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/bookmark_model.dart';
import '../services/collections_requests.dart';

final bookmarkProvider = FutureProvider((ref) => BookmarkFuture());

class BookmarkFuture {
  Future<List<Bookmark>> getSuggestion() async {
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
    return [Bookmark('123', '123', '123', '123', '123'), ...locationList];
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/bookmark_model.dart';

final BookmarksProvider =
    StateNotifierProvider<BookMarkNotifier, List<Bookmark>>((ref) {
  return BookMarkNotifier();
});

class BookMarkNotifier extends StateNotifier<List<Bookmark>> {
  BookMarkNotifier() : super([]);

  void addBookmark(Bookmark bookmark) {
    state = [...state, bookmark];
  }

  void removeBookmark(String bookmarkTag) {
    state = [
      for (final bookmark in state)
        if (bookmark.tag != bookmarkTag) bookmark,
    ];
  }
}

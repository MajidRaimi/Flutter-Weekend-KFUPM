import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectionsRequests {
  static UserCredential? userCredential;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Get user document
  Future<Map<String, dynamic>> getUserDocument() async {
    final userDocument = await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .get();
    return userDocument.data() as Map<String, dynamic>;
  }

  // Add Bookmark
  Future<void> addBookmark(String bookmark, int long, int lat) async {
    final userDocument = await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    bookmarks.add(
      {
        "cityName": bookmark,
        "long": long,
        "lat": lat,
      },
    );
    await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .update({"bookmark": bookmarks});
  }

  // Remove Bookmark
  Future<void> removeBookmark(String bookmark) async {
    final userDocument = await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    bookmarks.remove(bookmark);
    await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .update({"bookmark": bookmarks});
  }

  // Get Bookmarks
  Future<List<dynamic>> getBookmarks() async {
    final userDocument = await _firestore
        .collection("users")
        .doc(userCredential!.user!.uid)
        .get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    return bookmarks;
  }
}

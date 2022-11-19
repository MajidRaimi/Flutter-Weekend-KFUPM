import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectionsRequests {
  static User? currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Get user document
  Future<Map<String, dynamic>> getUserDocument() async {
    final userDocument =
        await _firestore.collection("users").doc(currentUser!.uid).get();
    return userDocument.data() as Map<String, dynamic>;
  }

  Future<List<dynamic>> getLocations() async {
    final locations = await _firestore.collection("locations").get();
    return locations.docs.map((e) => e.data()).toList();
  }

  // Add Bookmark
  Future<void> addBookmark(String locationName, String location,
      String imageLink, String tag, String information) async {
    final userDocument =
        await _firestore.collection("users").doc(currentUser!.uid).get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    bookmarks.add(
      {
        "locationName": locationName,
        "location": location,
        "imageLink": imageLink,
        "tag": tag,
        "information": information,
      },
    );
    await _firestore
        .collection("users")
        .doc(currentUser!.uid)
        .update({"bookmark": bookmarks});
  }

  // Remove Bookmark
  Future<void> removeBookmark(String bookmark) async {
    final userDocument =
        await _firestore.collection("users").doc(currentUser!.uid).get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    bookmarks.remove(bookmark);
    await _firestore
        .collection("users")
        .doc(currentUser!.uid)
        .update({"bookmark": bookmarks});
  }

  // Get Bookmarks
  Future<List<dynamic>> getBookmarks() async {
    final userDocument =
        await _firestore.collection("users").doc(currentUser!.uid).get();
    final bookmarks = userDocument.data()!["bookmark"] as List<dynamic>;
    return bookmarks;
  }
}

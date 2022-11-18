import 'package:flutter/material.dart';
import 'package:iau_flutter_weekend/services/collection_requests.dart';

class TestBookmarks extends StatelessWidget {
  const TestBookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _bookmarkController = TextEditingController();
    CollectionsRequests _collectionsInstance = CollectionsRequests();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Bookmarks'),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _bookmarkController,
                decoration: const InputDecoration(
                  labelText: "Bookmark Name",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_bookmarkController.text);
                  _collectionsInstance.addBookmark(
                    _bookmarkController.text,
                    0,
                    0,
                  );
                },
                child: const Text("Add"),
              ),
              ElevatedButton(
                onPressed: () {
                  _collectionsInstance.removeBookmark(
                    _bookmarkController.text,
                  );
                },
                child: const Text("Remove"),
              ),
              ElevatedButton(
                onPressed: () async {
                  List<dynamic> bookmarks =
                      await _collectionsInstance.getBookmarks();
                  print(bookmarks);
                },
                child: const Text("Get"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

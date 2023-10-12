import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  final List<String> bookmarks;

  BookmarksPage(this.bookmarks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookmarks[index]),
          );
        },
      ),
    );
  }
}

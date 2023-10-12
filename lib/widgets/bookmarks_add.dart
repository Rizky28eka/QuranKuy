import 'package:flutter/material.dart';

import '../pages/al-quran/Bookmarks.dart';

class AddBookmarkWidget extends StatefulWidget {
  @override
  _AddBookmarkWidgetState createState() => _AddBookmarkWidgetState();
}

class _AddBookmarkWidgetState extends State<AddBookmarkWidget> {
  List<String> bookmarks = [];

  void addBookmark() {
    setState(() {
      bookmarks.add('New Bookmark');
    });
  }

  void navigateToBookmarksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookmarksPage(bookmarks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: addBookmark,
        ),
        Text('Tap the bookmark icon to add a bookmark'),
        ElevatedButton(
          onPressed: navigateToBookmarksPage,
          child: Text('View Bookmarks'),
        ),
      ],
    );
  }
}

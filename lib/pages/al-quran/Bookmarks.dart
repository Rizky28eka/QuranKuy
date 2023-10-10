import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<dynamic> bookmarks;

  const BookmarkPage({required this.bookmarks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bookmarks.isEmpty
          ? Center(child: Text('No bookmarks added.'))
          : ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final chapter = bookmarks[index];
                final name = chapter['name_simple'];
                final meaning = chapter['translated_name']['name'];
                final verses = chapter['verses_count'];

                return ListTile(
                  title: Text(name),
                  subtitle: Text('$meaning - Ayat: $verses'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}

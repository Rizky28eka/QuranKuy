import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Bookmarks.dart';
import 'Detail_Ayat_Page.dart';

class SuratListPage extends StatefulWidget {
  @override
  _SuratListPageState createState() => _SuratListPageState();
}

class _SuratListPageState extends State<SuratListPage> {
  List<dynamic>? chapters;
  List<dynamic> bookmarks = [];

  @override
  void initState() {
    super.initState();
    fetchChapters();
  }

  Future<void> fetchChapters() async {
    final response =
        await http.get(Uri.parse('https://api.quran.com/api/v4/chapters'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null && data['chapters'] != null) {
        setState(() {
          chapters = data['chapters'];
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch chapters.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void toggleBookmark(dynamic chapter) {
    if (bookmarks.contains(chapter)) {
      setState(() {
        bookmarks.remove(chapter);
      });
    } else {
      setState(() {
        bookmarks.add(chapter);
      });
    }
  }

  bool isBookmarked(dynamic chapter) {
    return bookmarks.contains(chapter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chapters == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              key: UniqueKey(),
              itemCount: chapters!.length,
              itemBuilder: (context, index) {
                final chapter = chapters![index];
                final name = chapter['name_simple'];
                final meaning = chapter['translated_name']['name'];
                final verses = chapter['verses_count'];

                return ListTile(
                  title: Text(name),
                  subtitle: Text('$meaning - Ayat: $verses'),
                  trailing: IconButton(
                    icon: Icon(
                      isBookmarked(chapter)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),
                    onPressed: () {
                      toggleBookmark(chapter);
                      if (isBookmarked(chapter)) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BookmarksPage(
                        //      bookmarks ,
                        //     ),
                        //   ),
                        // );
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailAyatPage(
                          name: name,
                          meaning: meaning,
                          verses: verses,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

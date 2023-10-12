import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/al-quran/Bookmarks.dart';
import '../pages/al-quran/Juz_List_Page.dart';
import '../pages/al-quran/Surat_List_Page.dart';

class QuranTabbar extends StatefulWidget {
  final List<dynamic> bookmarks;

  QuranTabbar({required this.bookmarks});

  @override
  State<QuranTabbar> createState() => QuranTabbarState();
}

class QuranTabbarState extends State<QuranTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = [
    SuratListPage(),
    JuzListPage(),
    // BookmarkPage(
    //   bookmarks: [],
    // ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _children.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Image.asset(
              'assets/icons/IcBack.png',
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Al-Quran',
          style: GoogleFonts.crimsonText(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Surat',
              ),
              Tab(
                text: 'Juz',
              ),
              Tab(
                text: 'Bookmarks',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SuratListPage(),
                JuzListPage(),
                // BookmarksPage(bookmarks: widget.bookmarks),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

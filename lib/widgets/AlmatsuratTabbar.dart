import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/al-matsurat/DzikirPagi.dart';
import '../pages/al-matsurat/DzikirSore.dart';

class AlmatsuratTabbar extends StatefulWidget {
  const AlmatsuratTabbar({Key? key}) : super(key: key);

  @override
  _AlmatsuratTabbarState createState() => _AlmatsuratTabbarState();
}

class _AlmatsuratTabbarState extends State<AlmatsuratTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = [
    DzikirPagiPage(),
    DzikirSorePage(),
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
          'Al-Matsurat',
          style: GoogleFonts.crimsonText(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'Pagi',
            ),
            Tab(
              text: 'Sore',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _children,
      ),
    );
  }
}

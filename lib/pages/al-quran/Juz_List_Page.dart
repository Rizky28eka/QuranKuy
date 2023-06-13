import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Detail_Ayat_Page.dart';

class JuzListPage extends StatefulWidget {
  @override
  _JuzListPageState createState() => _JuzListPageState();
}

class _JuzListPageState extends State<JuzListPage> {
  late List<dynamic> juzs;

  @override
  void initState() {
    super.initState();
    fetchJuzs();
  }

  Future<void> fetchJuzs() async {
    final response =
        await http.get(Uri.parse('https://api.quran.com/api/v4/juzs'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        juzs = data['juzs'];
      });
    } else {
      // Error handling
      print('Failed to fetch juzs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_null_comparison
      body: juzs == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: juzs.length,
              itemBuilder: (context, index) {
                final juz = juzs[index];
                final juzNumber = juz['juz_number'];

                return ListTile(
                  title: Text('Juz $juzNumber'),
                  trailing: Icon(Icons.bookmark),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailAyatPage(
                          name: 'Juz $juzNumber',
                          meaning: '', // Juz tidak memiliki arti
                          verses: 0, // Juz tidak memiliki jumlah ayat
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

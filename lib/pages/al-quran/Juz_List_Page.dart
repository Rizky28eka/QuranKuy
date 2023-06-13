import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Detail_Ayat_Page.dart';

class JuzListPage extends StatefulWidget {
  @override
  _JuzListPageState createState() => _JuzListPageState();
}

class _JuzListPageState extends State<JuzListPage> {
  List<dynamic>? juzs;

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
      if (data != null && data['juzs'] != null) {
        setState(() {
          juzs = data['juzs'];
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch juzs.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: juzs == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              key: UniqueKey(),
              itemCount: juzs!.length,
              itemBuilder: (context, index) {
                final juz = juzs![index];
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

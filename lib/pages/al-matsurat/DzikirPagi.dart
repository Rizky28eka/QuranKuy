import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DzikirPagi extends StatefulWidget {
  @override
  _DzikirPagiState createState() => _DzikirPagiState();
}

class _DzikirPagiState extends State<DzikirPagi> {
  List<dynamic> dzikirList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api-almatsurat-default-rtdb.firebaseio.com/AlmatsuratPagi.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        dzikirList = data as List<dynamic>;
      });
    } else {
      // Handle API error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: dzikirList.map((dzikir) {
            return _createUIGetItem(
              dzikir['judul'],
              dzikir['ayat'],
              dzikir['arti'],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _createUIGetItem(String judul, String arab, String arti) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          Text(
            judul,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 8),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              arab,
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dubai,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            arti,
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}

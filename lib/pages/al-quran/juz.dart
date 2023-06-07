import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class JuzPage extends StatefulWidget {
  const JuzPage({Key? key}) : super(key: key);

  @override
  _JuzPageState createState() => _JuzPageState();
}

class _JuzPageState extends State<JuzPage> {
  List<dynamic> juzList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Completer<void> completer = Completer<void>();

    try {
      final response =
          await http.get(Uri.parse('https://api.quran.com/api/v4/juzs'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          juzList = data['data'];
        });
        completer.complete();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        completer.completeError(
            'Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
      completer.completeError(error);
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: juzList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: juzList.length,
                itemBuilder: (context, index) {
                  final juz = juzList[index];
                  return ListTile(
                    title: Text(
                      'Juz ${juz['juz_number']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      'Surah: ${juz['surahs'][0]['name_simple']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

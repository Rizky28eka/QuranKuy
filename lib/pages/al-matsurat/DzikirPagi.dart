import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DzikirPage extends StatefulWidget {
  @override
  _DzikirPageState createState() => _DzikirPageState();
}

class _DzikirPageState extends State<DzikirPage> {
  List<DzikirData> dzikirList = [];

  Future<void> fetchDzikir() async {
    final response = await http
        .get(Uri.parse('https://api.muslimapi.com/v1/DzikirPagiPetang'));

    if (response.statusCode == 200) {
      final dzikirData = jsonDecode(response.body)['data'];

      setState(() {
        dzikirList = dzikirData
            .map<DzikirData>((json) => DzikirData.fromJson(json))
            .toList();
      });
    } else {
      throw Exception('Failed to load dzikir');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDzikir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dzikirList.length,
        itemBuilder: (BuildContext context, int index) {
          final dzikir = dzikirList[index];
          return ListTile(
            title: Text(
              dzikir.ayat,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(dzikir.arti),
          );
        },
      ),
    );
  }
}

class DzikirData {
  final String ayat;
  final String arti;

  DzikirData({
    required this.ayat,
    required this.arti,
  });

  factory DzikirData.fromJson(Map<String, dynamic> json) {
    return DzikirData(
      ayat: json['latin'],
      arti: json['translation'],
    );
  }
}

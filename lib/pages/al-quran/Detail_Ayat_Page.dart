import 'package:flutter/material.dart';

class DetailAyatPage extends StatelessWidget {
  final String name;
  final String meaning;
  final int verses;

  const DetailAyatPage({
    Key? key,
    required this.name,
    required this.meaning,
    required this.verses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Ayat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: $name'),
          Text('Meaning: $meaning'),
          Text('Verses: $verses'),
        ],
      ),
    );
  }
}

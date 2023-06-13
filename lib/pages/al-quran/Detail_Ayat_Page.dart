import 'package:flutter/material.dart';

class DetailAyatPage extends StatelessWidget {
  final String name;
  final String meaning;
  final int verses;

  DetailAyatPage({
    required this.name,
    required this.meaning,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama Surat: $name'),
            Text('Arti Surat: $meaning'),
            Text('Jumlah Ayat: $verses'),
          ],
        ),
      ),
    );
  }
}

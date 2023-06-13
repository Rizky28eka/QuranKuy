import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrayerTimes extends StatefulWidget {
  @override
  _PrayerTimesState createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  Map<String, String> prayerTimes = {};

  Future<void> fetchPrayerTimes() async {
    final response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=Jakarta&country=Indonesia&method=8'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final timings = data['data']['timings'];

      setState(() {
        prayerTimes = timings;
      });
    } else {
      throw Exception('Failed to fetch prayer times');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: prayerTimes.length,
        itemBuilder: (context, index) {
          final key = prayerTimes.keys.elementAt(index);
          final value = prayerTimes[key];

          return ListTile(
            title: Text(key),
            subtitle: Text(value!),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrayerTimes(),
    );
  }
}

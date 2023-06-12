import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DzikirPage extends StatefulWidget {
  const DzikirPage({Key? key}) : super(key: key);

  @override
  _DzikirPageState createState() => _DzikirPageState();
}

class _DzikirPageState extends State<DzikirPage> {
  List<dynamic> dzikirList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.muslimapi.com/v1/DzikirPagiPetang'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dzikirList = data['data'];
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: dzikirList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: dzikirList.length,
                itemBuilder: (context, index) {
                  final dzikir = dzikirList[index];
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 16,
                        right: 16,
                      ),
                      title: Text(
                        dzikir['ayat'],
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        dzikir['arti'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

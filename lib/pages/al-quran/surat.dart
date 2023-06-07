import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SuratPage extends StatefulWidget {
  const SuratPage({Key? key}) : super(key: key);

  @override
  _SuratPageState createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  List<dynamic> suratList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.quran.com/api/v4/chapters'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          suratList = data['chapters'];
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
        child: suratList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: suratList.length,
                itemBuilder: (context, index) {
                  final surat = suratList[index];
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 16,
                        right: 16,
                      ),
                      title: Text(
                        surat['name_simple'],
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            surat['translated_name']['name'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Jumlah ayat: ${surat['verses_count']}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

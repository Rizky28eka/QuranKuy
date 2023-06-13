import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SyahadatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/icons/IcBack.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Syahadat Page',
          style: GoogleFonts.crimsonText(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'أشهد أن لا إله إلا الله وأشهد أن محمدًا رسول الله',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Asyhadu an laa ilaha illallah, wa asyhadu anna muhammadar rasulullah.',
                    style: GoogleFonts.crimsonText(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Artinya: ',
                      style: GoogleFonts.crimsonText(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Aku bersaksi bahwa tiada ilah yang berhak disembah selain Allah, dan aku bersaksi bahwa Muhammad adalah utusan Allah',
                          style: GoogleFonts.crimsonText(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

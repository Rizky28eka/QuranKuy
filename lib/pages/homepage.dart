import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurankuy_2/pages/doa/Doa_pilihan.dart';
import 'package:qurankuy_2/pages/shalat/jadwalshalat.dart';
import '../widgets/AlmatsuratTabbar.dart';
import '../widgets/QuranTabbar.dart';
import '../widgets/style.dart';
import 'syahadat/syahadat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bckg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/IcApp.png',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'NgajiKuy',
                        style: GoogleFonts.crimsonText(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  
                  buildButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuranTabbar(
                            bookmarks: [],
                          ),
                        ),
                      );
                    },
                    buttonText: 'Al-Quran',
                  ),
                  SizedBox(height: 30),
                  buildButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlmatsuratTabbar(),
                        ),
                      );
                    },
                    buttonText: 'Al-Matsurat',
                  ),
                  SizedBox(height: 30),
                  buildButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoaPilihan(),
                        ),
                      );
                    },
                    buttonText: 'Doa Pilihan',
                  ),
                  SizedBox(height: 30),
                  buildButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SyahadatPage(),
                        ),
                      );
                    },
                    buttonText: 'Syahadat',
                  ),
                  SizedBox(height: 30),
                  buildButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JadwalShalatPage(),
                          ));
                    },
                    buttonText: 'Jadwal Shalat',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      {required VoidCallback onPressed, required String buttonText}) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: GoogleFonts.crimsonText(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

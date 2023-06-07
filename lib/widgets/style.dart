import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0B2447);
  static const Color FontColorWhite = Color(0xffcfcfcf);
  static const Color FontColorPurple = Color(0xFF6200EE);
  static const Color FontColorBlue = Color(0xFF2c3545);

  static const Color ButtonColor = Color(0xFF19A7CE);
}

class AppTextStyles {
  static final TextStyle textNormal = GoogleFonts.crimsonText(
    fontSize: 10,
  );

  static final TextStyle textBold = GoogleFonts.crimsonText(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle GoogleFont = GoogleFonts.crimsonText();
}

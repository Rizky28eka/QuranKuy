import 'package:flutter/material.dart';
import 'package:qurankuy_2/widgets/AppStyle.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double fontSize; // Tambahkan properti ukuran font

  CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.fontSize = 16.0, // Atur ukuran font default di sini
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: AppColors.primaryColor, // Warna teks
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
      child: Text(
        text,
        style: textStyle ??
            GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                  fontSize: fontSize), // Gunakan ukuran font yang disesuaikan
            ),
      ),
    );
  }
}

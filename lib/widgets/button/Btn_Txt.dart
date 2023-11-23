import 'package:flutter/material.dart';
import 'package:qurankuy_2/widgets/AppStyle.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double fontSize;

  CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
      child: Text(
        text,
        style: textStyle ??
            GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: fontSize),
            ),
      ),
    );
  }
}

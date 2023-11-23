import 'package:flutter/material.dart';
import 'package:qurankuy_2/widgets/AppStyle.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final Color? buttonColor;
  final FontWeight? fontWeight;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.width = 200.0,
    this.height = 48.0,
    this.buttonColor,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: textStyle ??
            GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: fontWeight,
              ),
            ),
      ),
    );
  }
}

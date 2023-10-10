import 'package:flutter/material.dart';

class IconRounded extends StatelessWidget {
  final String imagePath;
  final double iconSize;
  final Color backgroundColor;

  IconRounded({
    required this.imagePath,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize + 10,
      height: iconSize + 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: iconSize,
          height: iconSize,
        ),
      ),
    );
  }
}

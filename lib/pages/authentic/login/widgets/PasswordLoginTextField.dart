import 'package:flutter/material.dart';

class PasswordLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  PasswordLoginTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true, // Mengubah teks menjadi tersembunyi (kata sandi)
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ), // Ikon kunci di sebelah kiri input
      ),
    );
  }
}

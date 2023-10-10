import 'package:flutter/material.dart';

class EmailLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  EmailLoginTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
          Icons.email,
          color: Colors.white,
        ), // Ikon email di sebelah kiri input
      ),
      keyboardType: TextInputType.emailAddress, // Keyboard tipe email
    );
  }
}

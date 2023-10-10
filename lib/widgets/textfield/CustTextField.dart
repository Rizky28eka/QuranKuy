import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
          Icons.person,
          color: Colors.white,
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

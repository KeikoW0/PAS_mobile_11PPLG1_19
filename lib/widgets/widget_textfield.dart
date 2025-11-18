import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(labelText)),
      controller: textEditingController,
    );
  }
}

// REUSABLE TEXT FIELD COMPONENT
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

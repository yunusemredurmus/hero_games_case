import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, this.hintText, this.controller, this.obscureText});
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  


  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20,
      controller: controller,
      enabled: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}

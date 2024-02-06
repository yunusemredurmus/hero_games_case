import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.controller,
    this.obscureText,
    this.maxLines,
  });
  final String? labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLines;

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
        labelText: labelText,
      ),
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
    );
  }
}

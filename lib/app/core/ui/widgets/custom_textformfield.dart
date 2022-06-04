import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CustomTextformfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final int? maxlines;
  final int? minlines;
  final TextInputType? keyboardType;

  const CustomTextformfield({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.onChange,
    this.obscureText = false,
    this.maxlines = 1,
    this.minlines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLines: maxlines,
      minLines: minlines,
      keyboardType: keyboardType,
    );
  }
}

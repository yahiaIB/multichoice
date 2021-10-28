import 'package:flutter/material.dart';
import 'package:multichoice/styles/custom_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  TextFormFieldCustom(
      {required this.controller,
      required this.labelText,
      required this.validation,
      this.suffixIcon});

  final TextEditingController controller;
  final Function validation;
  final String labelText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (v) => validation(v!),
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: CustomColors.accentColor),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: '$labelText *',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: CustomColors.buttonColor),
        ),
      ),
    );
  }
}

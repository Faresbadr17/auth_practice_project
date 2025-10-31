import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.controller,
    this.isObscure = false,
    this.suffixIcon,
    this.validator,
  });
  final String? hintText;
  final TextEditingController? controller;
  final isObscure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      style: TextStyle(color: ColorsManager.white),
    );
  }
}

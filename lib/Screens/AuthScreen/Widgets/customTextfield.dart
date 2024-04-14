import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController? controller;
  bool ispass;
  InputDecoration? decoration;
  final String? Function(String?)? validator;
  CustomTextfield( {
    Key? key,
    this.controller,
    this.decoration,
    this.validator,
    required this.ispass
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      obscureText: ispass,
      decoration: decoration,
      validator: validator,
    );
  }
}

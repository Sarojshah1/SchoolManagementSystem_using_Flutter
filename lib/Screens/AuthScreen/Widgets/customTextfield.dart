import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController? controller;
  bool ispass;
  InputDecoration? decoration;
  CustomTextfield( {
    Key? key,
    this.controller,
    this.decoration,
    required this.ispass
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      obscureText: ispass,
      decoration: decoration,
    );
  }
}

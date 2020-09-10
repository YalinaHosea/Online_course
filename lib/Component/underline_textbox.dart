import 'package:flutter/material.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/screens/TambahPertanyaan_screens.dart';

class Underline_textbox extends StatelessWidget {
  final String label;
  final bool obscure;
  final TextEditingController controller;

  const Underline_textbox({
    Key key,
    @required this.label,
    @required this.obscure,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kGrey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBlueColor))));
  }
}

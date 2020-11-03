import 'package:flutter/material.dart';
import 'package:online_course/services/constants/constants.dart';

class TextArea extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  const TextArea({Key key, @required this.controller, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 10,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: kGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: kBlueColor),
        ),
      ),
    );
  }
}

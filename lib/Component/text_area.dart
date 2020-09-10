import 'package:flutter/material.dart';
import 'package:online_course/services/constants/constants.dart';

class TextArea extends StatelessWidget {
  final TextEditingController controller;
  const TextArea({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 10,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: kRedColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: kBlueColor),
        ),
      ),
    );
  }
}

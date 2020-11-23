import 'package:flutter/material.dart';
import 'package:online_course/services/constants/constants.dart';

class TxtEmail extends StatelessWidget {
  const TxtEmail({
    Key key,
    @required this.emailcontroller,
    this.validator,
  }) : super(key: key);

  final TextEditingController emailcontroller;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailcontroller,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          labelText: "Email",
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kGrey),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBlueColor))),
    );
  }
}

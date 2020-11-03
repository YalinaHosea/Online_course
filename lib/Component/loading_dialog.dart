import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String text) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 20), child: Text(text)),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showResponse(BuildContext context, String message, Function onpress) {
  // set up the button
  Widget okButton = FlatButton(child: Text("OK"), onPressed: onpress);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

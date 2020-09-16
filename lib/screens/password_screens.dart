import 'package:flutter/material.dart';
import 'package:online_course/Component/rounded_button.dart';
import 'package:online_course/models/registerrequest.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/services/validator/validator.dart';

class PasswordScreen extends StatefulWidget {
  final User user;
  const PasswordScreen({Key key, this.user}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> with Validator {
  final formkey = GlobalKey<FormState>();
  ApiRepository apiRepository = new ApiRepository();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController repasswordcontroller =
      new TextEditingController();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("Membuat akun ...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showResponse(BuildContext context, String message, bool error) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        if (error) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
    );

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

  register() async {
    showAlertDialog(context);
    String pass = passwordcontroller.text.toString();
    bool error = false;
    RegisterRequest req = new RegisterRequest(widget.user, pass);
    await apiRepository.register(req).then((value) {
      if (value.id_user == null) {
        error = true;
      }
      Navigator.pop(context);
      showResponse(context, value.message, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: new Text(
          "Password",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TxtPassword(
                  passwordcontroller: passwordcontroller,
                  validator: validateempty,
                  label: "Password",
                ),
                SizedBox(height: 20),
                TxtPassword(
                  passwordcontroller: repasswordcontroller,
                  label: "Masukkan ulang password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Data tidak boleh kosong";
                    } else if (value != passwordcontroller.text) {
                      return "Password tidak sesuai";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                RoundedButton(
                  text: "DAFTAR",
                  color: kBlueColor,
                  press: () {
                    if (formkey.currentState.validate()) {
                      formkey.currentState.save();
                      register();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TxtPassword extends StatelessWidget {
  const TxtPassword({
    Key key,
    @required this.passwordcontroller,
    this.validator,
    this.label,
  }) : super(key: key);

  final TextEditingController passwordcontroller;
  final String Function(String) validator;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: true,
      controller: passwordcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kGrey),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBlueColor))),
    );
  }
}

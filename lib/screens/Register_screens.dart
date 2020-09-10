import 'package:flutter/material.dart';
import 'package:online_course/Component/underline_textbox.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  signup() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()),
        (Route<dynamic> route) => false);
  }

  final TextEditingController namacontroller = new TextEditingController();
  final TextEditingController jenis_kelaminController =
      new TextEditingController();
  final TextEditingController tanggal_lahirController =
      new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController provinsiController = new TextEditingController();
  final TextEditingController nomor_teleponController =
      new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: new Text("SIGN UP",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              SizedBox(height: 30),
              Underline_textbox(
                  controller: namacontroller, obscure: false, label: "Nama"),
              Underline_textbox(
                  controller: jenis_kelaminController,
                  obscure: false,
                  label: "Jenis Kelamin"),
              Underline_textbox(
                  controller: tanggal_lahirController,
                  obscure: false,
                  label: "Tanggal Lahir"),
              Underline_textbox(
                  controller: alamatController,
                  obscure: false,
                  label: "Alamat"),
              Underline_textbox(
                  controller: provinsiController,
                  obscure: true,
                  label: "Provinsi"),
              Underline_textbox(
                  controller: nomor_teleponController,
                  obscure: true,
                  label: "No Telepon"),
              Underline_textbox(
                  controller: emailController, obscure: true, label: "Email"),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ClipRRect(
                    child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kBlueColor,
                        onPressed: () {},
                        child: Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/Component/underline_textbox.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/user.dart';

class EditProfil extends StatefulWidget {
  final User user;

  const EditProfil({Key key, this.user}) : super(key: key);
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final TextEditingController namaController = new TextEditingController();
  final TextEditingController no_hpController = new TextEditingController();
  final TextEditingController fotoController = new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController.text = widget.user.nama;
    no_hpController.text = widget.user.no_hp;
    fotoController.text = widget.user.foto;
    alamatController.text = widget.user.alamat;
    emailController.text = widget.user.email;
    passwordController.text = "dutani";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: new Text("Edit Profile",
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
                  Center(
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            widget.user.foto,
                            fit: BoxFit.cover,
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: SvgPicture.asset("assets/icons/round_edit.svg",
                              height: 30, width: 30),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Underline_textbox(
                      controller: namaController,
                      obscure: false,
                      label: "nama"),
                  Underline_textbox(
                      controller: no_hpController,
                      obscure: false,
                      label: "no hp"),
                  Underline_textbox(
                      controller: alamatController,
                      obscure: false,
                      label: "alamat"),
                  Underline_textbox(
                      controller: emailController,
                      obscure: false,
                      label: "email"),
                  Underline_textbox(
                      controller: passwordController,
                      obscure: true,
                      label: "password"),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ClipRRect(
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            color: kBlueColor,
                            onPressed: () {},
                            child: Text(
                              "simpan",
                              style: TextStyle(color: Colors.white),
                            )),
                      ))
                ])));
  }
}

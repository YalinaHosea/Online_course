import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_course/Component/text_input.dart';
import 'package:online_course/Component/underline_textbox.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/password_screens.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/services/validator/validator.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validator {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernamecontroller = new TextEditingController();

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
  DateFormat dateFormat = new DateFormat("dd MMMM yyyy");
  DateFormat datepost = new DateFormat("yyyy-MM-dd");
  DateTime tanggal;
  int jk;
  String provinsi;

  signup() {
    String username = usernamecontroller.text.toString();
    String nama = namacontroller.text.toString();
    String tgl_lahir = datepost.format(tanggal);
    int kelamin = jk;
    String alamat = alamatController.text.toString();
    String prov = provinsi;
    String nohp = nomor_teleponController.text.toString();
    String email = emailController.text.toString();
    User user = new User();
    user.iDUser = username;
    user.nama = nama;
    user.tanggalLahir = tgl_lahir;
    user.jenisKelamin = kelamin.toString();
    user.alamat = alamat;
    user.provinsi = prov;
    user.nomorTelpon = nohp;
    user.email = email;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PasswordScreen(
                  user: user,
                )));
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Txtinput(
                    controller: usernamecontroller,
                    label: "Username",
                    validator: validateempty,
                  ),
                  SizedBox(height: 20),
                  Txtinput(
                    controller: namacontroller,
                    label: "Nama",
                    validator: validateempty,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    readOnly: true,
                    controller: tanggal_lahirController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: tanggal == null
                                        ? DateTime.now()
                                        : tanggal,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now())
                                .then((value) => {
                                      if (value == null)
                                        {
                                          if (tanggal == null)
                                            {tanggal_lahirController.text = ""}
                                          else
                                            {
                                              tanggal_lahirController.text =
                                                  dateFormat.format(tanggal)
                                            }
                                        }
                                      else
                                        {
                                          setState(() {
                                            tanggal = value;
                                          }),
                                          tanggal_lahirController.text =
                                              dateFormat.format(tanggal)
                                        }
                                    });
                          },
                        ),
                        contentPadding: EdgeInsets.all(0),
                        labelText: "Tanggal Lahir",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kBlueColor),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            jk = 1;
                          });
                        },
                        child: Container(
                          width: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: jk != 1 ? Colors.black12 : kBlueColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "L",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            jk = 2;
                          });
                        },
                        child: Container(
                          width: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: jk != 2 ? Colors.black12 : Colors.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "P",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Txtinput(
                    controller: alamatController,
                    label: "Alamat",
                    validator: validateempty,
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Provinsi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  DropdownButton(
                    hint: Text("Pilih provinsi"),
                    value: provinsi,
                    items: list_provinsi.map(
                      (value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        provinsi = value;
                      });
                    },
                  ),
                  Txtinput(
                    controller: nomor_teleponController,
                    label: "No Telepon",
                    validator: validateempty,
                  ),
                  SizedBox(height: 20),
                  Txtinput(
                    controller: emailController,
                    label: "Email",
                    validator: validateempty,
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            color: kBlueColor,
                            onPressed: () {
                              if (formkey.currentState.validate()) {
                                formkey.currentState.save();
                                signup();
                              }
                            },
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(color: Colors.white),
                            )),
                      )),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}

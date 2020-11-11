import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/pertanyaan.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/Pertanyaan_screens/pertanyaan_saya_screen.dart';
import 'package:online_course/screens/TambahPertanyaan_screens.dart';
import 'package:online_course/screens/editprofil_screen.dart';
import 'package:online_course/screens/history_screen.dart';
import 'package:online_course/screens/login_sreens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  final User user;

  const ProfilScreen({Key key, this.user}) : super(key: key);
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  signout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.user.foto,
                      fit: BoxFit.cover,
                      height: 80.0,
                      width: 80.0,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    widget.user.nama,
                    style: kHeadingxSTyle.copyWith(fontSize: 20.0),
                  ),
                  new Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditProfil(
                                    user: widget.user,
                                  )));
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Historyscreen()));
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/history.svg",
                      height: 30.0,
                      width: 30.0,
                      color: kBlueColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "History",
                      style: kTitleTextStyle.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PertanyaanSayaScreen()));
                    },
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/question.svg",
                          height: 30.0,
                          width: 30.0,
                          color: kBlueColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Pertanyaan Saya",
                          style: kTitleTextStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        )
                      ],
                    ))),
            SizedBox(
              height: 15.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TambahPertanyaan(
                                  title: "Pusat Bantuan",
                                  tipe: 2,
                                )));
                  },
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/call-center.svg",
                        height: 30.0,
                        width: 30.0,
                        color: kBlueColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Pusat Bantuan",
                        style: kTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GestureDetector(
                onTap: () => {
                  signout(),
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/logout.svg",
                      height: 30.0,
                      width: 30.0,
                      color: kRedColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Logout",
                      style: kTitleTextStyle.copyWith(color: kRedColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

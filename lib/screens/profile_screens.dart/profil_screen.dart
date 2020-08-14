import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/user.dart';
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.user.foto,
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
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
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
                    style: kTitleTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
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
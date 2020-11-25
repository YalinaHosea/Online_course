import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/login_sreens.dart';
import 'package:online_course/screens/materi_screen/details_screens.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Historyscreen extends StatefulWidget {
  @override
  _HistoryscreenState createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  SharedPreferences sharedPreferences;
  User user;
  ApiRepository apiRepository = new ApiRepository();

  Future<User> checkloginstatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      var jsonstring = sharedPreferences.getString("user");
      var json = jsonDecode(jsonstring);
      user = User.fromJson(json);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: new Text("History",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: FutureBuilder(
                future: checkloginstatus(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return FutureBuilder(
                        future: apiRepository.getHistory(user.iDUser),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 25,
                                    ),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  History per = snapshot.data[index];
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 300,
                                              child: Text(
                                                per.namaMateri,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            new Spacer(),
                                            //     SvgPicture.asset(
                                            //       "assets/icons/more.svg",
                                            //       height: 12,
                                            //       width: 12,
                                            //     )
                                            //   ],
                                            // ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Text(
                                                per.createAt,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black45,
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        )
                                      ]);
                                });
                          }
                        });
                  }
                })));
  }
}

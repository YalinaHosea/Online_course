import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/login_sreens.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/pertanyaan.dart';
import 'package:online_course/screens/jawaban_screens.dart/jawaban_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FasilitatorFragment extends StatefulWidget {
  @override
  _FasilitatorFragmentState createState() => _FasilitatorFragmentState();
}

class _FasilitatorFragmentState extends State<FasilitatorFragment> {
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
                        future: apiRepository.getPertanyaan(user.iDUser),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return (ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 25,
                                    ),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  Pertanyaan per = snapshot.data[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => JawabanScreen(
                                                    pertanyaan: per,
                                                  )));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              per.pertanyaanIsi,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            new Spacer(),
                                            SvgPicture.asset(
                                              "assets/icons/more.svg",
                                              height: 12,
                                              width: 12,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          per.createdAt,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black45,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          }
                        });
                  }
                })));
  }
}

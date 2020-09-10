import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/jawaban.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/jawaban_screens.dart/user_jawaban.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JawabanScreen extends StatefulWidget {
  @override
  _JawabanScreenState createState() => _JawabanScreenState();
}

class _JawabanScreenState extends State<JawabanScreen> {
  SharedPreferences sharedPreferences;
  User user;

  Future<User> loaduser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") != null) {
      var json = sharedPreferences.getString("user");
      Map userMap = jsonDecode(json);
      user = User.fromJson(userMap);
    }
    return user;
  }

  Future<Jawaban> loadjawaban() async {
    var response = await Dio().post(url_jawaban);

    Jawaban jawaban;
    jawaban = Jawaban.fromJson(response.data);

    return jawaban;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: loaduser(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return (FutureBuilder(
                  future: loadjawaban(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserPosted_Jawaban(
                              username: user.nama,
                              asset: user.foto,
                              datetime: snapshot.data.pertanyaan.addtime,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                snapshot.data.pertanyaan.pertanyaan,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(snapshot.data.pertanyaan.deskripsi,
                                style: TextStyle(color: Colors.black54)),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Jawaban",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            UserPosted_Jawaban(
                              username: snapshot.data.jawaban.pengajar.nama,
                              asset: snapshot.data.jawaban.pengajar.foto,
                              datetime: snapshot.data.jawaban.addtime,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(snapshot.data.jawaban.isi_jawaban,
                                style: TextStyle(color: Colors.black54)),
                          ],
                        )),
                      );
                    }
                  }));
            }
          }),
    );
  }
}

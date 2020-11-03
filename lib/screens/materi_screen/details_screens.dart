import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_course/Component/loading_dialog.dart';
import 'package:online_course/models/history_request.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/Pertanyaan_screens/pertanyaan_saya_screen.dart';
import 'package:online_course/screens/TambahPertanyaan_screens.dart';
import 'package:online_course/screens/materi_screen/component/materi_item.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/pengajar.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/screens/pengajar_screens.dart/pengajar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final Topik topik;

  const DetailsScreen({Key key, this.topik}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ApiRepository apiRepository = new ApiRepository();

  posthistory(Materi sub, String url) async {
    showAlertDialog(context, "");
    bool error = false;
    User user;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonstring = sharedPreferences.getString("user");
    var json = jsonDecode(jsonstring);
    user = User.fromJson(json);
    HistoryRequest historyRequest;
    historyRequest = new HistoryRequest(sub.id, sub.iD_User, user.iDUser,
        sub.nama_materi, int.parse(sub.id_topik));
    await apiRepository.postHistory(historyRequest).then((value) {
      if (value == null) {
        error = true;
        showResponse(
            context, "Terjadi kesalahan", () => Navigator.pop(context));
      } else {
        Navigator.pop(context);
        redirectURL(url);
      }
    });
  }

  redirectURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    int datalength = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: apiRepository.getPengajar(widget.topik.iDUser),
        builder: (context, snapshot) {
          return (Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F4EF),
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                    image: AssetImage(widget.topik.foto),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              snapshot.data == null
                  ? Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Text(widget.topik.topik,
                                  style: kHeadingxSTyle.copyWith(
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProfilePengajarScreen(
                                            pengajar: snapshot.data,
                                          ))),
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        snapshot.data.foto,
                                        height: 80.0,
                                        width: 80.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: Text(snapshot.data.nama,
                                        style: kHeadingxSTyle.copyWith(
                                            color: Colors.white,
                                            fontSize: 15.0)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(
                                      50,
                                    )),
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                        top: 30,
                                        left: 30,
                                        right: 30,
                                      ),
                                      child: FutureBuilder(
                                          future: apiRepository.getListSubTopik(
                                              widget.topik.iDTopik),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return (Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ));
                                            } else {
                                              if (snapshot.data.isEmpty) {
                                                return (Container(
                                                  child: Center(
                                                    child: Text(
                                                      "Belum ada materi",
                                                      style: TextStyle(
                                                          color: Colors.black45,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ));
                                              } else {
                                                return Column(
                                                  children: [
                                                    (Column(
                                                      children: snapshot.data
                                                          .map<Widget>((item) {
                                                        datalength++;
                                                        return Column(
                                                          children: [
                                                            MateriItem(
                                                              subs: item,
                                                              function_video: () =>
                                                                  posthistory(
                                                                      item,
                                                                      "https://www.youtube.com/watch?v=" +
                                                                          item.link_video),
                                                              function_pdf: () =>
                                                                  posthistory(
                                                                      item,
                                                                      item.link_pdf),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                            )
                                                          ],
                                                        );
                                                      }).toList(),
                                                    )),
                                                    if (datalength < 3)
                                                      SizedBox(
                                                        height: 500,
                                                      )
                                                  ],
                                                );
                                              }
                                            }
                                          }))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Positioned(
                bottom: -10,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ClipRRect(
                    child: FlatButton(
                      color: kBlueColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TambahPertanyaan(
                                      title: "Tanya Fasilitator",
                                    )));
                      },
                      child: Text(
                        "Tanya Fasilitator",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}

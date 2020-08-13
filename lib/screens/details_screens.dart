import 'package:dio/dio.dart';
import 'package:online_course/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/pengajar.dart';
import 'package:online_course/models/subtopik.dart';
import 'package:online_course/models/topik.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final Topik topik;

  const DetailsScreen({Key key, this.topik}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<Pengajar> getpengajar() async {
    var data = await Dio().post(url_pengajar);
    Pengajar pengajar;
    for (var item in data.data) {
      if (item["id_pengajar"] == widget.topik.id_pengajar) {
        pengajar = Pengajar(item["id_pengajar"], item["nama"], item["alamat"],
            item["no_hp"], item["email"], item["keahlian"], item["foto"]);
      }
    }
    return pengajar;
  }

  Future<List<Subtopik>> getsubTopik() async {
    var data = await Dio().post(url_subtopik);
    List<Subtopik> subtopiks = [];
    for (var item in data.data) {
      if (item["id_topik"] == widget.topik.id_topik) {
        Subtopik subtopik = Subtopik(
          item["id_subtopik"],
          item["id_topik"],
          item["judul"],
          item["link"],
        );
        subtopiks.add(subtopik);
      }
    }
    return subtopiks;
  }

  redirectUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not laung $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
            image: AssetImage(widget.topik.image),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: FutureBuilder(
          future: getpengajar(),
          builder: (context, snapshot) {
            return (Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text(widget.topik.judul,
                            style:
                                kHeadingxSTyle.copyWith(color: Colors.white)),
                      ),
                      snapshot.data == null
                          ? Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Column(
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
                                    child: Text(
                                  snapshot.data.nama,
                                  style: kHeadingxSTyle.copyWith(
                                      color: Colors.white, fontSize: 15.0),
                                ))
                              ],
                            )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
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
                              left: 30,
                              right: 30,
                              bottom: 80,
                              top: 10,
                            ),
                            child: FutureBuilder(
                                future: getsubTopik(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return (Container(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ));
                                  } else {
                                    return (ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              color: kBlueColor,
                                            ),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          Subtopik subs = snapshot.data[index];
                                          return Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  (index + 1).toString(),
                                                  style: kSubheadingextStyle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      subs.judul,
                                                      style: kTitleTextStyle,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => redirectUrl(
                                                          subs.link),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons
                                                                  .play_circle_filled,
                                                              color:
                                                                  kBestSellerColor),
                                                          Text(
                                                            "Putar video",
                                                            style: TextStyle(
                                                                color:
                                                                    kBlueColor,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }));
                                  }
                                })),
                      ],
                    ),
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}

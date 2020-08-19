import 'package:dio/dio.dart';
import 'package:online_course/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/pengajar.dart';
import 'package:online_course/models/subtopik.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/screens/pengajar_screens.dart/pengajar_screen.dart';
import 'package:social_share/social_share.dart';
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
            item["deskripsi"],
            item["link_video"],
            item["link_pdf"],
            item["link_web"]);
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
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
                      Center(
                        child: Text(widget.topik.judul,
                            style:
                                kHeadingxSTyle.copyWith(color: Colors.white)),
                      ),
                      SizedBox(height: 15),
                      snapshot.data == null
                          ? Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PengajarScreen(
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
                                      child: Text(
                                    snapshot.data.nama,
                                    style: kHeadingxSTyle.copyWith(
                                        color: Colors.white, fontSize: 15.0),
                                  ))
                                ],
                              ),
                            )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.only(
                    //     top: 30, left: 30, right: 30, bottom: 10),
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
                        FutureBuilder(
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
                                    padding: EdgeInsets.all(30),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 30,
                                        ),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      Subtopik subs = snapshot.data[index];
                                      return Column(children: <Widget>[
                                        Row(children: <Widget>[
                                          Text(subs.judul,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                          new Spacer(),
                                          GestureDetector(
                                              onTap: () =>
                                                  SocialShare.shareWhatsapp(
                                                      subs.link_web),
                                              child: Icon(
                                                Icons.share,
                                                color: kBlueColor,
                                              ))
                                        ]),
                                        SizedBox(height: 15),
                                        Text(subs.deskripsi,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontStyle: FontStyle.italic)),
                                        SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () =>
                                              redirectUrl(subs.link_pdf),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.attach_file,
                                                  color: kBlueColor),
                                              SizedBox(width: 5),
                                              Text("Lihat Pdf")
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () =>
                                              redirectUrl(subs.link_video),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.play_circle_filled,
                                                  color: kBlueColor),
                                              SizedBox(width: 5),
                                              Text("Putar Video")
                                            ],
                                          ),
                                        )
                                      ]);
                                    }));
                              }
                            }),
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

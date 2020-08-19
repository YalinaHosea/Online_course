import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/screens/details_screens.dart';

class TopikScreen extends StatefulWidget {
  final Category category;

  const TopikScreen({Key key, this.category}) : super(key: key);

  @override
  _TopikScreenState createState() => _TopikScreenState();
}

class _TopikScreenState extends State<TopikScreen> {
  Future<List<Topik>> getTopik() async {
    var data = await Dio().post(url_topik);
    List<Topik> topiks = [];
    for (var item in data.data) {
      if (item["id_kategori"] == widget.category.idKategori) {
        Topik topik = Topik(
            item["id_kategori"],
            item["id_topik"],
            item["judul"],
            item["image"],
            item["id_pengajar"],
            item["nama_pengajar"]);
        topiks.add(topik);
      }
    }
    return topiks;
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
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Text("TOPIK", style: kHeadingxSTyle),
              Text("Kumpulan topik " + widget.category.name,
                  style: kSubheadingextStyle),
              SizedBox(height: 30),
              FutureBuilder(
                  future: getTopik(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return (Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return (Expanded(
                          child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 20.0,
                              children: snapshot.data.map<Widget>((item) {
                                return Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black
                                            ],
                                          ).createShader(Rect.fromLTRB(
                                              0, 30, rect.width, rect.height));
                                        },
                                        blendMode: BlendMode.darken,
                                        child: GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        DetailsScreen(
                                                          topik: item,
                                                        ))),
                                            child: Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                image: DecorationImage(
                                                  image: AssetImage(item.image),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 15,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              item.judul,
                                              style: kTitleTextStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "oleh " + item.nama_pengajar,
                                              style: kTitleTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w200,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ]),
                                    )
                                  ],
                                );
                              }).toList())));
                    }
                  })
            ])));
  }
}

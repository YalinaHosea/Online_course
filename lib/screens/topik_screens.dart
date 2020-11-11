import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/screens/materi_screen/details_screens.dart';

class TopikScreen extends StatefulWidget {
  final Category category;

  const TopikScreen({Key key, this.category}) : super(key: key);

  @override
  _TopikScreenState createState() => _TopikScreenState();
}

class _TopikScreenState extends State<TopikScreen> {
  ApiRepository apiRepository = new ApiRepository();

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
              Text("Kumpulan topik " + widget.category.namaKategori,
                  style: kSubheadingextStyle),
              SizedBox(height: 30),
              FutureBuilder(
                  future:
                      apiRepository.getListTopik(widget.category.iDKategori),
                  builder: (context, AsyncSnapshot<List<Topik>> snapshot) {
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
                                var image = item.foto;
                                if (image == null) {
                                  image = "";
                                }
                                return Stack(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetailsScreen(
                                                    topik: item,
                                                  ))),
                                      child: ClipRRect(
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
                                              ).createShader(Rect.fromLTRB(0,
                                                  30, rect.width, rect.height));
                                            },
                                            blendMode: BlendMode.darken,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  url_gambar_topik + image,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                            Color>(kBlueColor),
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/cancel.png"),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
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
                                              item.topik,
                                              style: kTitleTextStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "oleh " + item.iDUser,
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

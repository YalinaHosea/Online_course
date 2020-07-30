import 'package:online_course/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/subtopik.dart';
import 'package:online_course/models/topik.dart';

class DetailsScreen extends StatefulWidget {
  final Topik topik;

  const DetailsScreen({Key key, this.topik}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Subtopik> subtopiks;

  @override
  void initState() {
    filtertopik();
    // yg dijalanin pertama kali saat rendering
    // deklarasi variabel & fetching API
    super.initState();
  }

  void filtertopik() {
    subtopiks = listsubtopik
        .where((item) => item.id_topik == widget.topik.id_topik)
        .toList();
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
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
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
                  Text(widget.topik.judul,
                      style: kHeadingxSTyle.copyWith(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 60),
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
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                                  color: kBlueColor,
                                ),
                            itemCount: subtopiks.length,
                            itemBuilder: (context, index) {
                              Subtopik subs = subtopiks[index];
                              return Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      (index + 1).toString(),
                                      style: kSubheadingextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
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
                                        Text(
                                          "Oleh : " + subs.nama,
                                          style: kLabelStyle.copyWith(
                                              color: kBlueColor,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
  List<Topik> topiks;

  @override
  void initState() {
    filtertopik();
    // yg dijalanin pertama kali saat rendering
    // deklarasi variabel & fetching API
    super.initState();
  }

  void filtertopik() {
    topiks = listtopik
        .where((item) => item.id_kategori == widget.category.idKategori)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 20, top: 50, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () =>
                          Navigator.pop(context), //NavPop = buat ngeback
                      child: Icon(Icons.arrow_back_ios)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("TOPIK", style: kHeadingxSTyle),
              Text("Kumpulan topik " + widget.category.name,
                  style: kSubheadingextStyle),
              SizedBox(height: 30),
              Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      children: topiks.map((item) {
                        return Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black],
                                  ).createShader(Rect.fromLTRB(
                                      0, 30, rect.width, rect.height));
                                },
                                blendMode: BlendMode.darken,
                                child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailsScreen())),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item.judul,
                                      style: kTitleTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        );
                      }).toList()))
            ])));
  }
}

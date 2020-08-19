import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/profile_screens.dart/profil_screen.dart';
import 'package:online_course/screens/topik_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences sharedPreferences;
  User user;

  Future<User> checkloginstatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") != null) {
      var json = sharedPreferences.getString("user");
      Map userMap = jsonDecode(json);

      user = User.fromJson(userMap);
    }
    return user;
  }

  Future<List<Category>> getCategory() async {
    var data = await Dio().post(url_category);
    List<Category> categories = [];
    for (var item in data.data) {
      Category category = Category(item["idKategori"], item["name"],
          item["numOfCourses"], item["image"]);
      categories.add(category);
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: FutureBuilder(
          future: checkloginstatus(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return (Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
            } else {
              return (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/leaf.svg",
                            color: kBlueColor,
                            height: 25,
                            width: 25,
                          ),
                          Text("Dutani",
                              style: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfilScreen(
                                      user: user,
                                    ))),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(user.foto),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Hello, " + user.nama, style: kHeadingxSTyle),
                  Text("Temukan tips terbaik untuk bertani",
                      style: kSubheadingextStyle.copyWith(fontSize: 20)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/search.svg"),
                        SizedBox(width: 16),
                        Text(
                          "Search for anything",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0XFFA0A5BD),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Category", style: kHeadingxSTyle),
                      Text("See all",
                          style: kSubheadingextStyle.copyWith(
                              color: kBlueColor, fontSize: 18))
                    ],
                  ),
                  SizedBox(height: 30),
                  FutureBuilder(
                    future: getCategory(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return (Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ));
                      } else {
                        return (Expanded(
                          child: StaggeredGridView.countBuilder(
                              padding: EdgeInsets.all(0),
                              crossAxisCount: 2,
                              itemCount: snapshot.data.length,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              itemBuilder: (context, index) {
                                Category cat = snapshot.data[index];
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
                                                  builder: (_) => TopikScreen(
                                                        category: cat,
                                                      ))),
                                          child: Container(
                                            height: index.isEven ? 200 : 240,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                image: AssetImage(cat.image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      //hanya bisa ada di anak nya stack
                                      bottom: 15,
                                      left: 15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            cat.name,
                                            style: kTitleTextStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            cat.numOfCourses.toString() +
                                                ' Courses',
                                            style: kSubtitleTextStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1)),
                        ));
                      }
                    },
                  ),
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}

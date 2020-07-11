import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/screens/details_screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/user.png"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text("Hey OniCHan", style: kHeadingxSTyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
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
                      fontSize: 18,
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
                    style: kSubheadingextStyle.copyWith(color: kBlueColor))
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsScreen())),
                      child: Container(
                        height: index.isEven ? 200 : 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(categories[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                categories[index].name,
                                style: kTitleTextStyle,
                              ),
                              Text(
                                categories[index].numOfCourses.toString() +
                                    ' Courses',
                                style: kSubtitleTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
            ),
          ],
        ),
      ),
    );
  }
}

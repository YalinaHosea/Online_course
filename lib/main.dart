import 'package:flutter/material.dart';
import 'package:online_course/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

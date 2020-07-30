import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/screens/login_sreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Course App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}

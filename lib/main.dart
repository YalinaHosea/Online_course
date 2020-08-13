import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/screens/home_screens.dart';
import 'package:online_course/screens/login_sreens.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = pref.getString("user");
  runApp(MyApp(home: user == null ? LoginScreen() : HomeScreen()));
}

class MyApp extends StatelessWidget {
  final home;

  const MyApp({Key key, this.home}) : super(key: key);
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
      home: home,
    );
  }
}

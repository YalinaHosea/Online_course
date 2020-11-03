import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_course/Component/loading_dialog.dart';
import 'package:online_course/Component/rounded_button.dart';
import 'package:online_course/Component/text_area.dart';
import 'package:online_course/models/pertanyaanrequest.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/screens/login_sreens.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahPertanyaan extends StatefulWidget {
  final String title;

  const TambahPertanyaan({Key key, this.title}) : super(key: key);
  @override
  _TambahPertanyaanState createState() => _TambahPertanyaanState();
}

class _TambahPertanyaanState extends State<TambahPertanyaan> {
  final TextEditingController judulcontroller = new TextEditingController();
  final TextEditingController pertanyaancontroller =
      new TextEditingController();
  File imagepicked;
  final picker = ImagePicker();
  SharedPreferences sharedPreferences;
  User user;
  ApiRepository apiRepository = new ApiRepository();

  Future getImage() async {
    final pickedfile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedfile != null) {
        imagepicked = File(pickedfile.path);
      } else {
        print('no image selected');
      }
    });
  }

  responfunc(error) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  postpertanyaan() async {
    showAlertDialog(context, "Mengupload data ... ");
    String pertanyaan = pertanyaancontroller.text.toString();
    bool error = false;

    PertanyaanRequest pertanyaan_req =
        new PertanyaanRequest(user.iDUser, pertanyaan, imagepicked, 1);
    await apiRepository.post_pertanyaan(pertanyaan_req).then((value) {
      if (value.result.resultcode == -9) {
        error = true;
      }
      Navigator.pop(context);
      showResponse(
          context, value.result.resultmessage, () => responfunc(error));
    });
  }

  @override
  void initState() {
    super.initState();
    checkloginstatus();
  }

  checkloginstatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("user") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      var jsonstring = sharedPreferences.getString("user");
      var json = jsonDecode(jsonstring);
      user = User.fromJson(json);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: new Text(widget.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            // Underline_textbox(
            //     label: "Judul Pertanyaan",
            //     obscure: false,
            //     controller: judulcontroller),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "Pertanyaan",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            TextArea(
              controller: pertanyaancontroller,
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
                text: TextSpan(
                    text: "Lampirkan File",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                    children: <TextSpan>[
                  TextSpan(
                      text: " (optional)",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ])),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 100,
              height: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  color: kBlueColor,
                  onPressed: getImage,
                  child: Text(
                    "Upload",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            if (imagepicked != null)
              Image.file(imagepicked,
                  height: 100, width: 100, fit: BoxFit.contain),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              text: "POST",
              color: kBlueColor,
              press: () => {postpertanyaan()},
            )
          ],
        ),
      ),
    );
  }
}

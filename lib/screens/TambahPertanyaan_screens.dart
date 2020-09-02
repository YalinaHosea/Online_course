import 'package:flutter/material.dart';
import 'package:online_course/Component/rounded_button.dart';
import 'package:online_course/Component/text_area.dart';
import 'package:online_course/Component/underline_textbox.dart';
import 'package:online_course/constants.dart';

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
            Underline_textbox(
                label: "Judul Pertanyaan",
                obscure: false,
                controller: judulcontroller),
            SizedBox(
              height: 20,
            ),
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
                  onPressed: () {},
                  child: Text(
                    "Upload",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              text: "POST",
              color: kBlueColor,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}

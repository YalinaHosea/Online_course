import 'package:flutter/material.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/models/pengajar.dart';

class PengajarScreen extends StatefulWidget {
  final Pengajar pengajar;

  const PengajarScreen({Key key, this.pengajar}) : super(key: key);
  @override
  _PengajarScreenState createState() => _PengajarScreenState();
}

class _PengajarScreenState extends State<PengajarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(widget.pengajar.nama, style: kHeadingxSTyle),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                widget.pengajar.foto,
                height: 90.0,
                width: 90.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Id Pengajar : ",
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
              Text(widget.pengajar.id_pengajar.toString(),
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
            ]),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Keahlian : ",
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
              SizedBox(width: 10),
              Text(widget.pengajar.keahlian,
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0))
            ]),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Email : ", style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
              Text(widget.pengajar.email,
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0))
            ]),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Alamat : ", style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
              Text(widget.pengajar.alamat,
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0))
            ]),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No hp : ",
                    style: kHeadingxSTyle.copyWith(fontSize: 20.0)),
                Text(
                  widget.pengajar.no_hp,
                  style: kHeadingxSTyle.copyWith(fontSize: 20.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

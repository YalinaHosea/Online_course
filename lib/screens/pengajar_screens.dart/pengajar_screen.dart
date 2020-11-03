import 'package:flutter/material.dart';
import 'package:online_course/models/pengajar.dart';

class ProfilePengajarScreen extends StatefulWidget {
  final Pengajar pengajar;

  const ProfilePengajarScreen({Key key, this.pengajar}) : super(key: key);
  @override
  _ProfilePengajarScreenState createState() => _ProfilePengajarScreenState();
}

class _ProfilePengajarScreenState extends State<ProfilePengajarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFF5F4EF),
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken),
                  image: AssetImage(widget.pengajar.foto),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Text(
                  widget.pengajar.nama,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      widget.pengajar.foto,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.pengajar.id_user,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white30,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Biodata_Item(
                          widget: widget,
                          icon: Icons.phone,
                          text: widget.pengajar.no_hp,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Biodata_Item(
                          widget: widget,
                          icon: Icons.email,
                          text: widget.pengajar.email,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Biodata_Item(
                            widget: widget,
                            icon: Icons.home,
                            text: widget.pengajar.alamat),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Biodata_Item extends StatelessWidget {
  final icon;
  final text;
  const Biodata_Item({
    Key key,
    @required this.widget,
    this.icon,
    this.text,
  }) : super(key: key);

  final ProfilePengajarScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

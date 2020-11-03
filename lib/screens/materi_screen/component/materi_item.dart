import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:social_share/social_share.dart';

class MateriItem extends StatelessWidget {
  const MateriItem({
    Key key,
    @required this.subs,
    this.function_video,
    this.function_pdf,
  }) : super(key: key);

  final Materi subs;
  final Function function_video;
  final Function function_pdf;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              subs.nama_materi,
              style: kTitleTextStyle.copyWith(fontSize: 18.0),
            ),
            new Spacer(),
            GestureDetector(
              onTap: () => SocialShare.shareWhatsapp(subs.link_video),
              child: Icon(
                Icons.share,
                color: kBlueColor,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          subs.deskripsi,
          style: TextStyle(color: Colors.black45, fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 18,
        ),
        GestureDetector(
          onTap: function_pdf,
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/pdf.svg",
                color: kBlueColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Lihat PDF",
                style: TextStyle(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: function_video,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.play_circle_filled,
                color: kBlueColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Putar Video",
                style: TextStyle(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        // YoutubePlayer(
        //   controller: vid_controller,
        //   showVideoProgressIndicator: true,
        // )
      ],
    ));
  }
}
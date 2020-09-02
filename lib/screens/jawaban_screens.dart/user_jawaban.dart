import 'package:flutter/material.dart';

class UserPosted_Jawaban extends StatelessWidget {
  final String username;
  final String datetime;
  final String asset;
  const UserPosted_Jawaban({
    Key key,
    this.username,
    this.datetime,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            asset,
            height: 40.0,
            width: 40.0,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              datetime,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.black38,
                  fontSize: 11),
            )
          ],
        )
      ],
    );
  }
}

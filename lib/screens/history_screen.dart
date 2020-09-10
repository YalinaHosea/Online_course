import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/history.dart';

class Historyscreen extends StatefulWidget {
  @override
  _HistoryscreenState createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  Future<List<History>> getHistory() async {
    var data = await Dio().post(url_history);
    List<History> historys = [];
    for (var item in data.data) {
      History history =
          History(item["id_materi"], item["judul_materi"], item["addtime"]);

      historys.add(history);
    }
    return historys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: FutureBuilder(
            future: getHistory(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return (ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 25,
                        ),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      History per = snapshot.data[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  per.judul_materi,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              new Spacer(),
                              SvgPicture.asset(
                                "assets/icons/more.svg",
                                height: 12,
                                width: 12,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            per.addtime,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                color: Colors.black45,
                                fontSize: 12),
                          )
                        ],
                      );
                    }));
              }
            }),
      ),
    );
  }
}

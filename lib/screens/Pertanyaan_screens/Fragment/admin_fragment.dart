import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/pertanyaan.dart';

class AdminFragment extends StatefulWidget {
  @override
  _FragmentAdminState createState() => _FragmentAdminState();
}

class _FragmentAdminState extends State<AdminFragment> {
  Future<List<Pertanyaan>> getPertanyaan() async {
    var data = await Dio().post(url_pertanyaan);
    List<Pertanyaan> pertanyaans = [];
    for (var item in data.data) {
      Pertanyaan pertanyaan = Pertanyaan(
          item["id"], item["pertanyaan"], item['deskripsi'], item["addtime"]);

      pertanyaans.add(pertanyaan);
    }
    return pertanyaans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: FutureBuilder(
            future: getPertanyaan(),
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
                      Pertanyaan per = snapshot.data[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                per.pertanyaan,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              per.addtime,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black45,
                                  fontSize: 12),
                            ),
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

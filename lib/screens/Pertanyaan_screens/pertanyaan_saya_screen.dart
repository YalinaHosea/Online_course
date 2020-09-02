import 'package:flutter/material.dart';
import 'package:online_course/constants.dart';
import 'package:online_course/screens/Pertanyaan_screens/Fragment/admin_fragment.dart';
import 'package:online_course/screens/Pertanyaan_screens/Fragment/fasilitator_fragment.dart';

class PertanyaanSayaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              unselectedLabelColor: kBlueColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: kBlueColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kBlueColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Fasilitator"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kBlueColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Pusat Bantuan"),
                    ),
                  ),
                )
              ]),
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
          title: new Text(
            "Pertanyaan Saya",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: TabBarView(children: [FasilitatorFragment(), AdminFragment()]),
      ),
    );
  }
}

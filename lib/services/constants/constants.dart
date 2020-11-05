import 'package:flutter/material.dart';

const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF80b155);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kRedColor = Color(0xFFE68C8C);
const kGrey = Color(0xFFD9D9D9);

const base_url = "https://dutatani.id/si_mlearning/public/";
const api = "api/";
const url_topik = api + "topik";
const url_materi = api + "materi";
const url_category = api + "kategori";
const url_adminpertanyaan = api + "admin/pertanyaan";
const url_register = api + "register";
const url_login = api + "login";
const url_pengajar = api + "pengajar";
const url_history = api + "history";
const url_pdf = base_url + "materipengajar/";

const list_provinsi = [
  "Nanggroe Aceh Darussalam",
  "Sumatera Utara",
  "Sumatera Barat",
  "Riau",
  "Kepulauan Riau",
  "Jambi",
  "Bengkulu",
  "Sumatera Selatan",
  "Kepulauan Bangka Belitung",
  "Lampung",
  "Banten",
  "DKI Jakarta",
  "Jawa Barat",
  "Jawa Tengah",
  "Jawa Timur",
  "DI Yogyakarta",
  "Bali",
  "Nusa Tenggara Barat",
  "Nusa Tenggara Timur",
  "Kalimantan Utara",
  "Kalimantan Selatan",
  "Kalimantan Barat",
  "Kalimantan Timur",
  "Kalimantan Tengah",
  "Gorontalo",
  "Sulawesi Utara",
  "Sulawesi Selatan",
  "Sulawesi Barat",
  "Sulawesi Tenggara",
  "Sulawesi Tengah",
  "Maluku",
  "Maluku Utara",
  "Papua",
  "Papua Barat"
];

const kHeadingxSTyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF336a29),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: 18,
  color: kTextColor,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF80b155),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

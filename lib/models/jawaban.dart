import 'package:online_course/models/pengajar.dart';
import 'package:online_course/models/pertanyaan.dart';

class Jawaban {
  // ignore: non_constant_identifier_names
  final Pertanyaan pertanyaan;
  final _jawaban jawaban;

  Jawaban(this.pertanyaan, this.jawaban);

  Jawaban.fromJson(Map<String, dynamic> json)
      : pertanyaan = json['pertanyaan'] != null
            ? new Pertanyaan.fromJson(json["pertanyaan"])
            : null,
        jawaban = json['jawaban'] != null
            ? new _jawaban.fromJson(json["jawaban"])
            : null;
}

class _jawaban {
  final Pengajar pengajar;
  final String isi_jawaban;
  final String addtime;

  _jawaban(this.pengajar, this.isi_jawaban, this.addtime);
  _jawaban.fromJson(Map<String, dynamic> json)
      : pengajar = json['pengajar'] != null
            ? new Pengajar.fromJson(json["pengajar"])
            : null,
        isi_jawaban = json['isi_jawaban'],
        addtime = json["addtime"];
}

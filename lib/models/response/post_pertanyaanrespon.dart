import 'package:online_course/models/result.dart';

class PostPertanyaanResponse {
  Result result;
  String iD_Penanya;
  String pertanyaan_isi;
  String gambar_pertanyaan;

  PostPertanyaanResponse(
      {this.result,
      this.iD_Penanya,
      this.pertanyaan_isi,
      this.gambar_pertanyaan});

  PostPertanyaanResponse.fromJson(Map<String, dynamic> json) {
    result =
        json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    iD_Penanya = json['ID_Penanya'];
    pertanyaan_isi = json['pertanyaan_isi'];
    gambar_pertanyaan = json['gambar_pertanyaan'];
  }
}

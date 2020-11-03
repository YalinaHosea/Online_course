import 'dart:io';

class PertanyaanRequest {
  final String iD_Penanya;
  final String pertanyaan_isi;
  final File gambar_pertanyaan;
  final int tipe;

  PertanyaanRequest(
      this.iD_Penanya, this.pertanyaan_isi, this.gambar_pertanyaan, this.tipe);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_Penanya'] = this.iD_Penanya;
    data['pertanyaan_isi'] = this.pertanyaan_isi;
    data['gambar_pertanyaan'] = this.gambar_pertanyaan;
    data['tipe'] = this.tipe;
    return data;
  }
}

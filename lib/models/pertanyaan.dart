class Pertanyaan {
  String pertanyaanId;
  String pertanyaanIsi;
  String createdAt;
  String updatedAt;
  String iDPenanya;
  String iDPenjawab;
  String jawabanIsi;
  String gambarPertanyaan;
  String tipe;

  Pertanyaan(item,
      {this.pertanyaanId,
      this.pertanyaanIsi,
      this.createdAt,
      this.updatedAt,
      this.iDPenanya,
      this.iDPenjawab,
      this.jawabanIsi,
      this.gambarPertanyaan,
      this.tipe});

  Pertanyaan.fromJson(Map<String, dynamic> json) {
    pertanyaanId = json['pertanyaan_id'];
    pertanyaanIsi = json['pertanyaan_isi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iDPenanya = json['ID_Penanya'];
    iDPenjawab = json['ID_Penjawab'];
    jawabanIsi = json['jawaban_isi'];
    gambarPertanyaan = json['gambar_pertanyaan'];
    tipe = json['tipe'];
  }
}

class Materi {
  int iD;
  String topik;
  String namaMateri;
  String deskripsi;
  String linkVideo;
  String dokumen;
  String createAt;
  String editAt;
  String iDUser;

  Materi(
      {this.iD,
      this.topik,
      this.namaMateri,
      this.deskripsi,
      this.linkVideo,
      this.dokumen,
      this.createAt,
      this.editAt,
      this.iDUser});

  Materi.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    topik = json['Topik'];
    namaMateri = json['nama_materi'];
    deskripsi = json['deskripsi'];
    linkVideo = json['link_video'];
    dokumen = json['dokumen'];
    createAt = json['create_at'];
    editAt = json['edit_at'];
    iDUser = json['ID_User'];
  }
}

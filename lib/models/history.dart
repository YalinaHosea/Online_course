class History {
  String id;
  String iDMateri;
  String iDPengajar;
  String iDUser;
  String namaMateri;
  String iDTopik;
  String iD;
  String deskripsi;
  String linkVideo;
  String dokumen;
  String createAt;
  String editAt;

  History(item,
      {this.id,
      this.iDMateri,
      this.iDPengajar,
      this.iDUser,
      this.namaMateri,
      this.iDTopik,
      this.iD,
      this.deskripsi,
      this.linkVideo,
      this.dokumen,
      this.createAt,
      this.editAt});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iDMateri = json['ID_Materi'];
    iDPengajar = json['ID_Pengajar'];
    iDUser = json['ID_User'];
    namaMateri = json['nama_materi'];
    iDTopik = json['ID_Topik'];
    iD = json['ID'];
    deskripsi = json['deskripsi'];
    linkVideo = json['link_video'];
    dokumen = json['dokumen'];
    createAt = json['create_at'];
    editAt = json['edit_at'];
  }
}

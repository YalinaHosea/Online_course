class Topik {
  int iDTopik;
  String iDUser;
  String iDKategori;
  String topik;
  String foto;

  Topik({this.iDTopik, this.iDUser, this.iDKategori, this.topik, this.foto});

  Topik.fromJson(Map<String, dynamic> json) {
    iDTopik = json['ID_Topik'];
    iDUser = json['ID_User'];
    iDKategori = json['ID_Kategori'];
    topik = json['Topik'];
    foto = "assets/images/rugicangkok.jpg";
  }
}

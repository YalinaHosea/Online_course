class Category {
  String iDKategori;
  String namaKategori;
  String deskripsi;
  int aktif;
  String foto;

  Category(
      {this.iDKategori,
      this.namaKategori,
      this.deskripsi,
      this.aktif,
      this.foto});

  Category.fromJson(Map<String, dynamic> json) {
    iDKategori = json['ID_Kategori'];
    namaKategori = json['Nama_Kategori'];
    deskripsi = json['Deskripsi'];
    aktif = json['aktif'];
    foto = "assets/images/menanam.jpeg";
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['ID_Kategori'] = this.iDKategori;
  //   data['Nama_Kategori'] = this.namaKategori;
  //   data['Deskripsi'] = this.deskripsi;
  //   data['aktif'] = this.aktif;
  //   return data;
  // }
}

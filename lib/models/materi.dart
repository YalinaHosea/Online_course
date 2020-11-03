class Materi {
  // ignore: non_constant_identifier_names
  final int id;
  final String id_topik;
  // ignore: non_constant_identifier_names
  final String nama_materi;
  final String deskripsi;
  final String link_video;
  final String dokumen;
  final String create_at;
  final String edit_at;

  Materi(this.id, this.id_topik, this.nama_materi, this.deskripsi,
      this.link_video, this.dokumen, this.create_at, this.edit_at);

  Materi.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['ID'].toString()),
        id_topik = json['ID_Topik'],
        nama_materi = json['nama_materi'],
        deskripsi = json['deskripsi'],
        link_video = json['link_video'],
        dokumen = json['dokumen'],
        create_at = json['create_at'],
        edit_at = json['edit_at'];
}

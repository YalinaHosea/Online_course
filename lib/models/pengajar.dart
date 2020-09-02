class Pengajar {
  final int id_pengajar;
  final String nama;
  final String alamat;
  final String no_hp;
  final String email;
  final String keahlian;
  final String foto;

  Pengajar(this.id_pengajar, this.nama, this.alamat, this.no_hp, this.email,
      this.keahlian, this.foto);

  Pengajar.fromJson(Map<String, dynamic> json)
      : id_pengajar = int.parse(json['id_pengajar'].toString()),
        nama = json['nama'],
        alamat = json['alamat'],
        no_hp = json['no_hp'],
        email = json['email'],
        keahlian = json['keahlian'],
        foto = json['foto'];
}

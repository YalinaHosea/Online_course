class Pengajar {
  // ignore: non_constant_identifier_names
  final String id_kategori;
  final String id_user;
  // ignore: non_constant_identifier_names
  final String nama;
  final int jenis_kelamin;
  final String tanggal_lahir;
  final String alamat;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  final String kelurahan;
  final String no_hp;
  final String email;
  final String foto;

  Pengajar(
    this.id_kategori,
    this.id_user,
    this.nama,
    this.jenis_kelamin,
    this.tanggal_lahir,
    this.alamat,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.kelurahan,
    this.no_hp,
    this.email,
    this.foto,
  );

  Pengajar.fromJson(Map<String, dynamic> json)
      : id_kategori = json['ID_Kategori'],
        id_user = json['ID_User'],
        nama = json['nama'],
        jenis_kelamin = int.parse(json['jenis_kelamin'].toString()),
        tanggal_lahir = json['tanggal_lahir'],
        alamat = json['alamat'],
        provinsi = json['provinsi'],
        kabupaten = json['kabupaten'],
        kecamatan = json['kecamatan'],
        kelurahan = json['kelurahan_desa'],
        no_hp = json['nomor_telpon'],
        email = json['Email'],
        foto = "assets/images/user_placehorder.png";
}

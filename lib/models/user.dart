class User {
  String iDUser;
  String nama;
  int jenisKelamin;
  String tanggalLahir;
  String alamat;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String kelurahanDesa;
  String nomorTelpon;
  String email;
  String foto;

  User(
      {this.iDUser,
      this.nama,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.provinsi,
      this.kabupaten,
      this.kecamatan,
      this.kelurahanDesa,
      this.nomorTelpon,
      this.email,
      this.foto});

  User.fromJson(Map<String, dynamic> json) {
    iDUser = json['ID_User'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    provinsi = json['provinsi'];
    kabupaten = json['kabupaten'];
    kecamatan = json['kecamatan'];
    kelurahanDesa = json['kelurahan_desa'];
    nomorTelpon = json['nomor_telpon'];
    email = json['Email'];
    foto = "assets/images/user.png";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['"ID_User"'] = '"' + this.iDUser + '"';
    data['"nama"'] = '"' + this.nama + '"';
    data['"jenis_kelamin"'] = this.jenisKelamin;
    data['"tanggal_lahir"'] = '"' + this.tanggalLahir + '"';
    data['"alamat"'] = '"' + this.alamat + '"';
    data['"provinsi"'] = '"' + this.provinsi + '"';
    data['"kabupaten"'] = '"' + this.kabupaten + '"';
    data['"kecamatan"'] = '"' + this.kecamatan + '"';
    data['"kelurahan_desa"'] = '"' + this.kelurahanDesa + '"';
    data['"nomor_telpon"'] = '"' + this.nomorTelpon + '"';
    data['"Email"'] = '"' + this.email + '"';
    data['"Foto"'] = '"' + this.foto + '"';
    return data;
  }
}

class User {
  final int id;
  final String nama;
  final String no_hp;
  final String foto;
  final String alamat;
  final String email;

  User(this.id, this.nama, this.no_hp, this.foto, this.alamat, this.email);

  @override
  String toString() {
    // TODO: implement toString
    return id.toString() + " " + nama + " " + no_hp + " " + alamat + " " + foto;
  }

  User.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        nama = json['nama'],
        no_hp = json['no_hp'],
        foto = json['foto'],
        alamat = json['alamat'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'nama': nama,
        "no_hp": no_hp,
        "foto": foto,
        "alamat": alamat,
        "email": email,
      };
}

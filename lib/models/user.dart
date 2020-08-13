class User {
  final int id;
  final String nama;
  final String alamat;
  final String no_hp;
  final String foto;

  User(this.id, this.nama, this.alamat, this.no_hp, this.foto);

  @override
  String toString() {
    // TODO: implement toString
    return id.toString() + " " + nama + " " + no_hp + " " + alamat + " " + foto;
  }

  User.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        nama = json['nama'],
        alamat = json['alamat'],
        no_hp = json['no_hp'],
        foto = json['foto'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'nama': nama,
        "alamat": alamat,
        "no_hp": no_hp,
        "foto": foto,
      };
}

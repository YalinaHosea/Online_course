class Pertanyaan {
  // ignore: non_constant_identifier_names
  final int id;
  // ignore: non_constant_identifier_names
  final String pertanyaan;
  final String deskripsi;
  final String addtime;

  Pertanyaan(this.id, this.pertanyaan, this.addtime, this.deskripsi);

  Pertanyaan.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        pertanyaan = json['pertanyaan'],
        deskripsi = json['deskripsi'],
        addtime = json['addtime'];
}

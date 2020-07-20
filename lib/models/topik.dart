class Topik {
  // ignore: non_constant_identifier_names
  final int id_kategori;
  // ignore: non_constant_identifier_names
  final int id_topik;
  final String judul;
  final String image;

  Topik(this.id_kategori, this.id_topik, this.judul, this.image);
}

List<Topik> listtopik = topikdata
    .map((item) => Topik(
        item["id_kategori"], item["id_topik"], item["judul"], item["image"]))
    .toList();

var topikdata = [
  {
    "id_kategori": 1,
    "id_topik": 1,
    "judul": "Menggali tanah",
    "image": "assets/images/menggali.jpg"
  },
  {
    "id_kategori": 1,
    "id_topik": 2,
    "judul": "Menanam bibit",
    "image": "assets/images/benih.jpg"
  },
  {
    "id_kategori": 1,
    "id_topik": 3,
    "judul": "Pemupukan",
    "image": "assets/images/pupuk.jpg"
  },
  {
    "id_kategori": 2,
    "id_topik": 4,
    "judul": "Menentukan harga",
    "image": "assets/images/harga.jpg"
  },
  {
    "id_kategori": 2,
    "id_topik": 5,
    "judul": "Memilih lokasi",
    "image": "assets/images/lokasi.jpg"
  },
  {
    "id_kategori": 2,
    "id_topik": 6,
    "judul": "Packing",
    "image": "assets/images/paket.jpg"
  },
  {
    "id_kategori": 2,
    "id_topik": 7,
    "judul": "Target konsumen",
    "image": "assets/images/pembeli.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 8,
    "judul": "Umpan",
    "image": "assets/images/umpan.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 9,
    "judul": "Memilih alat",
    "image": "assets/images/alat.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 10,
    "judul": "Membeli ternak",
    "image": "assets/images/beliternak.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 11,
    "judul": "Lahan",
    "image": "assets/images/lahan.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 12,
    "judul": "Pangan",
    "image": "assets/images/pangan.jpg"
  },
];

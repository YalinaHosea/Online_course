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
    "judul": "Pemanenan",
    "image": "assets/images/panen.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 9,
    "judul": "Perontokkan",
    "image": "assets/images/perontokkan.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 10,
    "judul": "Pengeringan",
    "image": "assets/images/pengeringan.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 11,
    "judul": "Penyimpanan",
    "image": "assets/images/simpan.jpg"
  },
  {
    "id_kategori": 3,
    "id_topik": 12,
    "judul": "Penggilingan",
    "image": "assets/images/giling.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 13,
    "judul": "Teknik Mencangkok",
    "image": "assets/images/teknikcangkok.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 14,
    "judul": "Syarat Mencangkok",
    "image": "assets/images/syaratcangkok.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 15,
    "judul": "Langkah Mencangkok",
    "image": "assets/images/langkahcangkok.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 16,
    "judul": "Manfaat Mencangkok",
    "image": "assets/images/manfaatcangkok.jpg"
  },
  {
    "id_kategori": 4,
    "id_topik": 17,
    "judul": "Kerugian Mencangkok",
    "image": "assets/images/rugicangkok.jpg"
  },
];

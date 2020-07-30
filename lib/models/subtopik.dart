class Subtopik {
  final int id_subtopik;
  final int id_topik;
  final String judul;
  final String nama;

  Subtopik(this.id_subtopik, this.id_topik, this.judul, this.nama);
}

List<Subtopik> listsubtopik = subtopikdata
    .map((item) => Subtopik(
        item["id_subtopik"], item["id_topik"], item["judul"], item["nama"]))
    .toList();

var subtopikdata = [
  {
    "id_subtopik": 1,
    "id_topik": 1,
    "judul": "Menggali tanah",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 2,
    "id_topik": 1,
    "judul": "Menyiapkan lahan",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 3,
    "id_topik": 1,
    "judul": "Menyediakan peralatan",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 4,
    "id_topik": 2,
    "judul": "Menanam Bibit",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 5,
    "id_topik": 2,
    "judul": "Memilih bibit",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 6,
    "id_topik": 2,
    "judul": "Menyiapkan pot ",
    "nama": "Yalina H"
  },
  {"id_subtopik": 7, "id_topik": 3, "judul": "Pemupukan", "nama": "Yalina H"},
  {
    "id_subtopik": 8,
    "id_topik": 3,
    "judul": "Pembuatan pupuk",
    "nama": "Yalina H"
  },
  {
    "id_subtopik": 9,
    "id_topik": 3,
    "judul": "Mulai memupuk",
    "nama": "Yalina H"
  },
];

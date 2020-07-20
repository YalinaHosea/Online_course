class Category {
  final int idKategori;
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.idKategori, this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(
        item["idKategori"], item["name"], item["courses"], item["image"]))
    .toList();

var categoriesData = [
  {
    "idKategori": 1,
    "name": "Menanam",
    "courses": 17,
    "image": "assets/images/menanam.jpeg"
  },
  {
    "idKategori": 2,
    "name": "Beternak",
    "courses": 25,
    "image": "assets/images/beternak-ayam-potong.jpg"
  },
  {
    "idKategori": 3,
    "name": "Panen",
    "courses": 13,
    "image": "assets/images/panen.jpg"
  },
  {
    "idKategori": 4,
    "name": "Kawin Silang",
    "courses": 17,
    "image": "assets/images/kawinsilangtanaman.jpeg"
  },
];

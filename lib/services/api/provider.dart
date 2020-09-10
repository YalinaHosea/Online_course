import 'package:dio/dio.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/models/response/login_response.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/services/constants/constants.dart';

class ApiProvider {
  final String baseUrl;
  Dio dio;
  ApiProvider(this.baseUrl, Dio _dio) {
    dio = _dio ?? Dio();
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 10000
      ..options.receiveTimeout = 10000;
  }

  Future<List<Category>> getCategory() async {
    Response response = await dio.post(url_category);
    List<Category> categories = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListKategori"]) {
        Category category = Category.fromJson(item);
        categories.add(category);
      }
      return categories;
    } else {
      return null;
    }
  }

  Future<LoginResponse> signin(String id, password) async {
    var data = {"ID_User": id, "password": password};
    Response response = await dio.post(url_login, data: data);
    if (response.statusCode == 200) {
      LoginResponse login = LoginResponse.fromJson(response.data);
      return login;
    } else {
      return null;
    }
  }

  Future<List<Topik>> getTopik(String id_kategori) async {
    var data = {"ID_Kategori": id_kategori};
    Response response = await dio.post(url_topik, data: data);
    List<Topik> topiks = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListTopik"]) {
        Topik topik = Topik.fromJson(item);
        topiks.add(topik);
      }
      return topiks;
    } else {
      return null;
    }
  }

  Future<List<Materi>> getMateri(String id_topik) async {
    Response response = await dio.post(url_subtopik);
    List<Materi> subtopiks = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListMateri"]) {
        Materi materi = Materi.fromJson(item);
        subtopiks.add(materi);
      }
      return subtopiks;
    } else {
      return null;
    }
  }
}

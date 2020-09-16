import 'package:dio/dio.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/models/register_respon.dart';
import 'package:online_course/models/registerrequest.dart';
import 'package:online_course/models/response/login_response.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/services/api/provider.dart';
import 'package:online_course/services/constants/constants.dart';

class ApiRepository {
  String base = base_url;
  var dio = Dio();
  ApiProvider provider;

  ApiRepository() {
    provider = ApiProvider(base, dio);
  }
  Future<List<Category>> get getListKategory => provider.getCategory();
  Future<List<Topik>> getTopik(String id_kategori) =>
      provider.getTopik(id_kategori);
  Future<List<Materi>> getMateri(String id_topik) =>
      provider.getMateri(id_topik);

  Future<LoginResponse> login(String id, password) =>
      provider.signin(id, password);

  Future<RegisterResponse> register(RegisterRequest request) =>
      provider.regis(request);
}

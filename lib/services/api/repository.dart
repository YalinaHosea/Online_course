import 'package:dio/dio.dart';
import 'package:online_course/models/category.dart';
import 'package:online_course/models/history.dart';
import 'package:online_course/models/history_request.dart';
import 'package:online_course/models/materi.dart';
import 'package:online_course/models/pengajar.dart';
import 'package:online_course/models/pertanyaan.dart';
import 'package:online_course/models/pertanyaanrequest.dart';
import 'package:online_course/models/register_respon.dart';
import 'package:online_course/models/registerrequest.dart';
import 'package:online_course/models/response/EditProfileResponse.dart';
import 'package:online_course/models/response/login_response.dart';
import 'package:online_course/models/response/post_pertanyaanrespon.dart';
import 'package:online_course/models/response/posthistory_response.dart';
import 'package:online_course/models/topik.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/services/api/provider.dart';
import 'package:online_course/services/constants/constants.dart';

class ApiRepository {
  String base = base_url;
  var dio = Dio();
  ApiProvider provider;

  ApiRepository() {
    provider = ApiProvider(base, dio);
  }
  Future<List<Category>> get getListkategory => provider.getCategory();
  Future<List<Topik>> getListTopik(String id_kategori) =>
      provider.getTopik(id_kategori);
  Future<List<Materi>> getListSubTopik(int id_topik) =>
      provider.getSubTopik(id_topik);
  Future<Pengajar> getPengajar(String id_pengajar) =>
      provider.getPengajar(id_pengajar);
  Future<LoginResponse> login(String id, password) =>
      provider.signin(id, password);
  Future<RegisterResponse> regis(RegisterRequest req) => provider.regis(req);
  Future<PostPertanyaanResponse> post_pertanyaan(PertanyaanRequest req) =>
      provider.post_pertanyaan(req);
  Future<List<Pertanyaan>> getPertanyaan(String user_id, int tipe) =>
      provider.getPertanyaan(user_id, tipe);
  Future<PostHistoryResponse> postHistory(HistoryRequest data) =>
      provider.postHistory(data);
  Future<List<History>> getHistory(String id) => provider.getHistory(id);
  Future<EditProfileResponse> editprofile(User req) =>
      provider.editprofile(req);
}

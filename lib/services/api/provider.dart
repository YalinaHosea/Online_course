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
import 'package:online_course/models/response/login_response.dart';
import 'package:online_course/models/response/post_pertanyaanrespon.dart';
import 'package:online_course/models/response/posthistory_response.dart';
import 'package:online_course/models/result.dart';
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
    Response response = await dio.get(url_category);
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
    var data = {"ID_User": id, "Password": password};
    Response response = await dio.post(
      url_login,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      LoginResponse login = LoginResponse.fromJson(response.data);
      return login;
    } else {
      Result result = new Result(-9, response.data["Result"]["ResultMessage"]);
      LoginResponse login = new LoginResponse(result: result);
      return login;
    }
  }

  Future<List<History>> getHistory(String id) async {
    Response response = await dio.get(url_history + "/" + id);
    List<History> historys = [];
    if (response.statusCode == 200) {
      for (var item in response.data["pertanyaan"]) {
        History history = History.fromJson(item);
        historys.add(history);
      }
      return historys;
    } else {
      return null;
    }
  }

  Future<PostHistoryResponse> postHistory(HistoryRequest data_history) async {
    var data = data_history.toJson();
    Response response = await dio.post(
      url_history,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      PostHistoryResponse his = PostHistoryResponse.fromJson(response.data);
      return his;
    } else {
      return null;
    }
  }

  Future<List<Pertanyaan>> getPertanyaan(String pertanyaan_id) async {
    Response response =
        await dio.get(url_adminpertanyaan + "/index/" + pertanyaan_id);
    List<Pertanyaan> pertanyaans = [];
    if (response.statusCode == 200) {
      for (var item in response.data["pertanyaan"]) {
        Pertanyaan pertanyaan = Pertanyaan.fromJson(item);
        pertanyaans.add(pertanyaan);
      }
      return pertanyaans;
    } else {
      return null;
    }
  }

  Future<PostPertanyaanResponse> post_pertanyaan(PertanyaanRequest req) async {
    PostPertanyaanResponse respon;
    Result err_result = new Result(-9, 'Terjadi Kesalahan');
    // var data = req.toJson();
    FormData formData = FormData.fromMap({
      "ID_Penanya": req.iD_Penanya,
      "pertanyaan_isi": req.pertanyaan_isi,
      "gambar_pertanyaan": req.gambar_pertanyaan,
      "tipe": req.tipe
    });
    try {
      Response response = await dio.post(
        url_adminpertanyaan,
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        respon = PostPertanyaanResponse.fromJson(response.data);
      } else {
        respon = new PostPertanyaanResponse(result: response.data["Result"]);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        respon = new PostPertanyaanResponse(result: err_result);
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        respon = new PostPertanyaanResponse(result: err_result);
      }
    }
    return respon;
  }

  Future<List<Topik>> getTopik(String id_kategori) async {
    Response response = await dio.get(url_topik + "/" + id_kategori);
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

  Future<List<Materi>> getSubTopik(int id_topik) async {
    Response response = await dio.get(url_materi + "/" + id_topik.toString());
    List<Materi> subtopiks = [];
    if (response.statusCode == 200) {
      for (var item in response.data["ListMateri"]) {
        Materi sub = Materi.fromJson(item);
        subtopiks.add(sub);
        return subtopiks;
      }
    } else {
      return null;
    }
  }

  Future<Pengajar> getPengajar(String id_pengajar) async {
    Response response = await dio.get(url_pengajar + "/" + id_pengajar);
    Pengajar pengajar;
    if (response.statusCode == 200) {
      for (var item in response.data["User"]) {
        pengajar = Pengajar.fromJson(item);
      }
      return pengajar;
    } else {
      return null;
    }
  }

  Future<RegisterResponse> regis(RegisterRequest req) async {
    var data = req.toJson();
    Response response = await dio.post(
      "register",
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ),
    );
    RegisterResponse respon;
    if (response.statusCode == 200 || response.statusCode == 201) {
      respon = RegisterResponse.fromJson(response.data);
    } else {
      respon =
          new RegisterResponse(message: "Data user sudah pernah terdaftar");
    }
    return respon;
  }
}

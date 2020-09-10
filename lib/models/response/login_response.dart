import 'package:online_course/models/result.dart';
import 'package:online_course/models/user.dart';

class LoginResponse {
  Result result;
  List<User> user;

  LoginResponse({this.result, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result =
        json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    if (json['User'] != null) {
      user = new List<User>();
      json['User'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }
}

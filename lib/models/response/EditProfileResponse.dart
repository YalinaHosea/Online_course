import 'package:online_course/models/result.dart';
import 'package:online_course/models/user.dart';

class EditProfileResponse {
  Result result;
  User user;

  EditProfileResponse({this.result, this.user});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    result =
        json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    user = json['update_profile'] != null
        ? new User.fromJson(json['update_profile'])
        : null;
  }
}

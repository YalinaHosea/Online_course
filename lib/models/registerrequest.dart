import 'package:online_course/models/user.dart';

class RegisterRequest {
  final User user;
  final String password;

  RegisterRequest(this.user, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_User'] = this.user.iDUser;
    data['nama'] = this.user.nama;
    data['jenis_kelamin'] = this.user.jenisKelamin;
    data['tanggal_lahir'] = this.user.tanggalLahir;
    data['alamat'] = this.user.alamat;
    data['provinsi'] = this.user.provinsi;
    data['nomor_telpon'] = this.user.nomorTelpon;
    data['Email'] = this.user.email;
    data['Password'] = this.password;
    return data;
  }
}

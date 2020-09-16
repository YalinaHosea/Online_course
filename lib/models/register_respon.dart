class RegisterResponse {
  String message;
  String id_user;
  String nama;
  String foto;

  RegisterResponse({this.message, this.id_user, this.nama, this.foto});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    id_user = json["ID_User"];
    nama = json["nama"];
    foto = json["foto"];
  }
}

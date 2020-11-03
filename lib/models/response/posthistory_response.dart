class PostHistoryResponse {
  String message;
  String iDUser;
  String namaMateri;
  int iDMateri;

  PostHistoryResponse(
      {this.message, this.iDUser, this.namaMateri, this.iDMateri});

  PostHistoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    iDUser = json['ID_User'];
    namaMateri = json['nama_materi'];
    iDMateri = json['ID_materi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['ID_User'] = this.iDUser;
    data['nama_materi'] = this.namaMateri;
    data['ID_materi'] = this.iDMateri;
    return data;
  }
}

class HistoryRequest {
  final int iD_Materi;
  final String iD_Pengajar;
  final String iD_User;
  final String nama_materi;
  final int iD_Topik;

  HistoryRequest(this.iD_Materi, this.iD_Pengajar, this.iD_User,
      this.nama_materi, this.iD_Topik);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_Materi'] = this.iD_Materi;
    data['ID_Pengajar'] = this.iD_Pengajar;
    data['ID_User'] = this.iD_User;
    data['nama_materi'] = this.nama_materi;
    data['ID_Topik'] = this.iD_Topik;

    return data;
  }
}

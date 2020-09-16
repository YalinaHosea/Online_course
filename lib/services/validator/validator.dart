class Validator {
  String validateempty(String value) {
    if (value.isEmpty) {
      return "Data tidak boleh kosong";
    }
    return null;
  }
}

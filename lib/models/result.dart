class Result {
  final int resultcode;
  final String resultmessage;

  Result(this.resultcode, this.resultmessage);

  Result.fromJson(Map<String, dynamic> json)
      : resultcode = int.parse(json['ResultCode'].toString()),
        resultmessage = json['ResultMessage'];
}

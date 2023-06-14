class ResultModel {
  String? result;
  int? factId;

  ResultModel(this.result, this.factId);

  factory ResultModel.fromJson(Map<String, dynamic> data) {
    return ResultModel(data['0'], data['__factid__']);
  }
}
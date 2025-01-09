class OtpVerficationModel {
  OtpVerificationData? data;
  bool? status;
  int? code;
  String? message;

  OtpVerficationModel({this.data, this.status, this.code, this.message});

  OtpVerficationModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? OtpVerificationData.fromJson(json['data'])
        : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class OtpVerificationData {
  int? id;
  String? name;
  String? token;
  String? refreshToken;

  OtpVerificationData({this.id, this.name, this.token, this.refreshToken});

  OtpVerificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
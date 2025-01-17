class RegisterModel {
  Data? data;
  bool? status;
  int? code;
  String? message;

  RegisterModel({this.data, this.status, this.code, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? name;
  String? mobileNumber;
  String? userOtpVerification;
  String? userOtpCreatedAt;
  String? latitude;
  String? longitude;
  int? id;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.name,
      this.mobileNumber,
      this.userOtpVerification,
      this.userOtpCreatedAt,
      this.latitude,
      this.longitude,
      this.id,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobile_number'];
    userOtpVerification = json['user_otp_verification'];
    userOtpCreatedAt = json['user_otp_created_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['user_otp_verification'] = userOtpVerification;
    data['user_otp_created_at'] = userOtpCreatedAt;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

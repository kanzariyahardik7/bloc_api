class LoginModel {
  Data? data;
  bool? status;
  int? code;
  String? message;

  LoginModel({this.data, this.status, this.code, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;

  Data({this.id, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.userId, required super.mobile});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(userId: json['id'], mobile: json['mobile']);
  }
}

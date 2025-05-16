import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendOtp(String mobile);
  Future<UserModel> verifyOtp(String mobile, String otp);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> sendOtp(String mobile) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<UserModel> verifyOtp(String mobile, String otp) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(userId: '123', mobile: mobile);
  }
}

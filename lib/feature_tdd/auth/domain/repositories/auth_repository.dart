import '../entities/user.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String mobile);
  Future<User> verifyOtp(String mobile, String otp);
}

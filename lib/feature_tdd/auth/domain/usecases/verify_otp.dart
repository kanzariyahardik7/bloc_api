import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<User> call(String mobile, String otp) async {
    return await repository.verifyOtp(mobile, otp);
  }
}

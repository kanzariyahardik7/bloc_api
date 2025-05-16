import '../repositories/auth_repository.dart';

class LoginWithMobile {
  final AuthRepository repository;

  LoginWithMobile(this.repository);

  Future<void> call(String mobile) async {
    return await repository.sendOtp(mobile);
  }
}

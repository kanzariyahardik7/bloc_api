import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> sendOtp(String mobile) async {
    return await remoteDataSource.sendOtp(mobile);
  }

  @override
  Future<User> verifyOtp(String mobile, String otp) async {
    return await remoteDataSource.verifyOtp(mobile, otp);
  }
}

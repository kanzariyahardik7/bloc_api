import 'package:bloc_api/features/auth/login/bloc/login_bloc.dart';
import 'package:bloc_api/features/auth/login/repo/login_repository.dart';
import 'package:bloc_api/features/master_products/bloc/product_bloc.dart';
import 'package:bloc_api/features/master_products/repo/product_repository.dart';
import 'package:bloc_api/features/auth/otp_verify/bloc/otp_bloc.dart';
import 'package:bloc_api/features/auth/otp_verify/repo/otp_repo.dart';
import 'package:bloc_api/features/auth/register/bloc/register_bloc.dart';
import 'package:bloc_api/features/auth/register/repo/register_repo.dart';
import 'package:bloc_api/network/network_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<NetworkApiService>(
      () => NetworkApiService(dio: getIt<Dio>()));
  //-----------------------------------------------------------------------------------------
  // login
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(networkApiService: getIt<NetworkApiService>()),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(loginRepository: getIt<LoginRepository>()),
  );
  //-----------------------------------------------------------------------------------------
  // register
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepository(apiService: getIt<NetworkApiService>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerRepository: getIt<RegisterRepository>()),
  );
  //-----------------------------------------------------------------------------------------
  // otp-verification
  getIt.registerLazySingleton<OtpRepo>(
    () => OtpRepo(networkApiService: getIt<NetworkApiService>()),
  );
  getIt.registerFactory<OtpVerifyBloc>(
    () => OtpVerifyBloc(otpRepo: getIt<OtpRepo>()),
  );
  //-----------------------------------------------------------------------------------------
  // product
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(networkApiService: getIt<NetworkApiService>()),
  );
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(productRepository: getIt<ProductRepository>()),
  );
  //-----------------------------------------------------------------------------------------
}

import '../model/login_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginOtpGetInitState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetInitState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class LoginOtpGetLoadingState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetLoadingState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class LoginOtpGetSuccessState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetSuccessState({required this.otpGetResponse});

  @override
  List<Object?> get props => [otpGetResponse];
}

class LoginOtpGetErrorState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetErrorState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

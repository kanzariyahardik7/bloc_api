import 'package:bloc_api/model/login_model.dart';
import 'package:bloc_api/model/otp_verification_model.dart';
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

class LoginOtpGetState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetState({required this.otpGetResponse});

  @override
  List<Object?> get props => [otpGetResponse];
}

class LoginOtpGetErrorState extends LoginState {
  final ApiResponse<LoginModel> otpGetResponse;
  LoginOtpGetErrorState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}
//-------------------------------------------------------------------------------

class LoginOtpVerifyLodingState extends LoginState {
  final ApiResponse<OtpVerficationModel> otpGetVerifyResponse;
  LoginOtpVerifyLodingState({required this.otpGetVerifyResponse});
  @override
  List<Object?> get props => [otpGetVerifyResponse];
}

class LoginOtpVerifyInitState extends LoginState {
  final ApiResponse<OtpVerficationModel> otpGetVerifyResponse;
  LoginOtpVerifyInitState({required this.otpGetVerifyResponse});
  @override
  List<Object?> get props => [otpGetVerifyResponse];
}

class LoginOtpVerifiedState extends LoginState {
  final ApiResponse<OtpVerficationModel> otpGetVerifyResponse;
  LoginOtpVerifiedState({required this.otpGetVerifyResponse});
  @override
  List<Object?> get props => [otpGetVerifyResponse];
}

class LoginOtpVerifyErrorState extends LoginState {
  final ApiResponse<OtpVerficationModel> otpGetVerifyResponse;
  LoginOtpVerifyErrorState({required this.otpGetVerifyResponse});
  @override
  List<Object?> get props => [otpGetVerifyResponse];
}

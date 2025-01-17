import 'package:bloc_api/features/auth/register/model/register_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class RegisterOtpGetInitState extends RegisterState {
  final ApiResponse<RegisterModel> otpGetResponse;
  RegisterOtpGetInitState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class RegisterOtpGetLoadingState extends RegisterState {
  final ApiResponse<RegisterModel> otpGetResponse;
  RegisterOtpGetLoadingState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class RegisterOtpGetSuccessState extends RegisterState {
  final ApiResponse<RegisterModel> otpGetResponse;
  RegisterOtpGetSuccessState({required this.otpGetResponse});

  @override
  List<Object?> get props => [otpGetResponse];
}

class RegisterOtpGetErrorState extends RegisterState {
  final ApiResponse<RegisterModel> otpGetResponse;
  RegisterOtpGetErrorState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

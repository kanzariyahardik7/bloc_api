import 'package:bloc_api/features/login/model/otp_verification_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:equatable/equatable.dart';

abstract class OtpVerificationState extends Equatable {}

class OtpVerificationInitState extends OtpVerificationState {
  final ApiResponse<OtpVerficationModel> otpGetResponse;
  OtpVerificationInitState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class OtpVerificationLodingState extends OtpVerificationState {
  final ApiResponse<OtpVerficationModel> otpGetResponse;
  OtpVerificationLodingState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class OtpVerificationCompleteState extends OtpVerificationState {
  final ApiResponse<OtpVerficationModel> otpGetResponse;
  OtpVerificationCompleteState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

class OtpVerificationErrorState extends OtpVerificationState {
  final ApiResponse<OtpVerficationModel> otpGetResponse;
  OtpVerificationErrorState({required this.otpGetResponse});
  @override
  List<Object?> get props => [otpGetResponse];
}

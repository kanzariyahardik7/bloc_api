import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/resource/api_end_points.dart';

import '../model/login_model.dart';
import '../model/otp_verification_model.dart';

class LoginRepository {
  final NetworkApiService networkApiService;
  LoginRepository({required this.networkApiService});

  Future<OtpVerficationModel?> otpVerification(Map<String, dynamic> req) async {
    try {
      final response = await networkApiService.postResponse(
          ApiEndPoints().loginVerifyOtp, req);
      final jsonData = OtpVerficationModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginModel?> generateOTP(Map<String, dynamic> req) async {
    try {
      final response = await networkApiService.postResponse(
          ApiEndPoints().loginGenerateOtp, req);
      final jsonData = LoginModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}

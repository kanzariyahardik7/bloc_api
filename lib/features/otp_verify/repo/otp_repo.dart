import 'package:bloc_api/features/login/model/otp_verification_model.dart';
import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/resource/api_end_points.dart';

class OtpRepo {
  final NetworkApiService networkApiService;
  OtpRepo({required this.networkApiService});

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
}

import 'package:bloc_api/features/auth/register/model/register_model.dart';
import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/resource/api_end_points.dart';

class RegisterRepository {
  final NetworkApiService networkApiService;
  RegisterRepository({required this.networkApiService});

  Future<RegisterModel?> registerGenerateOtp(Map<String, dynamic> req) async {
    try {
      final response = await networkApiService.postResponse(
          ApiEndPoints().registerGenerateOtp, req);
      final jsonData = RegisterModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:bloc_api/resource/api_end_points.dart';
import 'package:bloc_api/resource/app_exception.dart';
import 'package:bloc_api/network/base_api_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkApiService extends BaseApiService {
  late Dio _dio; // Dio instance to perform HTTP requests.

  // ApiService({required Dio dio}) : _dio = dio;
  NetworkApiService({required Dio dio}) {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndPoints().baseUrl,
      responseType: ResponseType.json,
      validateStatus: (status) {
        if (status == null) {
          return false;
        } else {
          return true;
        }
      },
    ))
      ..interceptors.addAll([LogInterceptor(), PrettyDioLogger()]);
  }

  @override
  Future postResponse(String urlPath, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    try {
      final response = await _dio.post(urlPath, data: jsonEncode(jsonBody));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future putResponse(String urlPath, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    try {
      final response = await _dio.put(urlPath, data: jsonEncode(jsonBody));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getResponse(String url, Map<String, dynamic>? queryParameters) async {
    dynamic responseJson;
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      responseJson = returnResponse(response);
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  @override
  Future deleteResponse(String urlPath, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    try {
      final response = await _dio.delete(urlPath, data: jsonEncode(jsonBody));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 201:
      case 400:
      // throw BadRequestException(response.toString());
      case 401:
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server');
    }
  }
}

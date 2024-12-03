import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/repo/product_repository.dart';
import 'package:dio/dio.dart';

class MainService {
  static final NetworkApiService networkApiService =
      NetworkApiService(dio: Dio());
  static final ProductRepository productRepository =
      ProductRepository(networkApiService: networkApiService);
}

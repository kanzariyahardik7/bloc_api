import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/repository/product_repository.dart';
import 'package:dio/dio.dart';

class Dependancy {
  static final NetworkApiService networkApiService =
      NetworkApiService(dio: Dio());
  static final ProductRepository productRepository =
      ProductRepository(networkApiService: networkApiService);
}

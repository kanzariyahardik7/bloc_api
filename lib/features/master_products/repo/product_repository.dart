import 'package:bloc_api/features/master_products/model/product_list_model.dart';
import 'package:bloc_api/resource/api_end_points.dart';
import 'package:bloc_api/network/network_api_service.dart';

class ProductRepository {
  final NetworkApiService networkApiService;
  ProductRepository({required this.networkApiService});

  Future<ProductListModel> getProductList(
      int businessid, Map<String, dynamic>? queryParameters) async {
    try {
      dynamic response = await networkApiService.getResponse(
          "${ApiEndPoints().getMasterProductList}/$businessid",
          queryParameters);
      final jsonData = ProductListModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}

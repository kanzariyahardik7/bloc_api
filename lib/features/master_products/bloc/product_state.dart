import 'package:bloc_api/features/master_products/model/product_list_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final ApiResponse<ProductListModel>? productListResponse;
  final List<MasterProductItemModel>? productList;
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int limit;

  const ProductState({
    this.productListResponse,
    this.productList = const [],
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalItems = 0,
    this.limit = 10,
  });

  ProductState copyWith({
    ApiResponse<ProductListModel>? productListResponse,
    List<MasterProductItemModel>? productList,
    int? currentPage,
    int? totalPages,
    int? totalItems,
    int? limit, // Fixed
  }) {
    return ProductState(
      productListResponse: productListResponse ?? ApiResponse.init(),
      productList: productList ?? this.productList,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [
        productListResponse,
        productList,
        currentPage,
        totalPages,
        totalItems,
        limit
      ];
}

import 'package:bloc_api/features/master_products/model/product_list_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {}

class ProductInitState extends ProductState {
  final ApiResponse<ProductListModel> productListResponse;
  ProductInitState({required this.productListResponse});
  @override
  List<Object?> get props => [productListResponse];
}

class ProductLoadingState extends ProductState {
  final ApiResponse<ProductListModel> productListResponse;
  ProductLoadingState({required this.productListResponse});
  @override
  List<Object?> get props => [productListResponse];
}

class ProductLoadedState extends ProductState {
  final ApiResponse<ProductListModel> productListResponse;
  final List<MasterProductItemModel> productList;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  ProductLoadedState(
      {required this.productListResponse,
      required this.productList,
      required this.currentPage,
      required this.totalPages,
      required this.totalItems});

  @override
  List<Object?> get props =>
      [productListResponse, productList, currentPage, totalPages, totalItems];
}

class ProductErrorState extends ProductState {
  final ApiResponse<ProductListModel> productListResponse;
  ProductErrorState({required this.productListResponse});
  @override
  List<Object?> get props => [productListResponse];
}

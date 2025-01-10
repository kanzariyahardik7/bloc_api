import 'package:bloc_api/features/master_products/model/product_list_model.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/features/master_products/repo/product_repository.dart';
import 'package:bloc_api/features/master_products/bloc/product_event.dart';
import 'package:bloc_api/features/master_products/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository})
      : super(ProductInitState(productListResponse: ApiResponse.init())) {
    on<ProductFetchEvent>(_getProductList);
    on<ResetProductEvent>(_resetProductEvent);
  }

  List<MasterProductItemModel> productList = [];
  int currentPage = 0;
  int totalPages = 0;
  int totalItems = 0;
  int limit = 10;
  _getProductList(ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState(productListResponse: ApiResponse.loading()));

    await productRepository
        .getProductList(event.businessid, event.queryParameters)
        .then(
      (value) {
        totalPages = value.data?.meta?.totalPages ?? 0;
        totalItems = value.data?.meta?.totalItems ?? 0;
        currentPage = value.data?.meta?.currentPage ?? 0;
        productList.addAll(value.data?.data ?? []);
        emit(ProductLoadedState(
            productListResponse: ApiResponse.completed(value),
            productList: productList,
            currentPage: currentPage,
            totalPages: totalPages,
            totalItems: totalItems));
      },
    ).onError(
      (error, stackTrace) {
        emit(ProductErrorState(
            productListResponse: ApiResponse.error(error.toString())));
      },
    );
  }

  _resetProductEvent(ResetProductEvent event, Emitter<ProductState> emit) {
    productList = [];
    currentPage = 0;
    totalPages = 0;
    totalItems = 0;
    emit(ProductInitState(productListResponse: ApiResponse.init()));
  }
}

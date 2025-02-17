import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/features/master_products/repo/product_repository.dart';
import 'package:bloc_api/features/master_products/bloc/product_event.dart';
import 'package:bloc_api/features/master_products/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<ProductFetchEvent>(_getProductList);
    on<ResetProductEvent>(_resetProductEvent);
  }

  _getProductList(ProductFetchEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productListResponse: ApiResponse.loading()));

    try {
      final value = await productRepository.getProductList(
          event.businessid, event.queryParameters);

      state.productList!.addAll(value.data?.data ?? []);

      emit(state.copyWith(
        productListResponse: ApiResponse.completed(value),
        productList: state.productList,
        currentPage: value.data?.meta?.currentPage ?? state.currentPage,
        totalPages: value.data?.meta?.totalPages ?? state.totalPages,
        totalItems: value.data?.meta?.totalItems ?? state.totalItems,
      ));
    } catch (error) {
      emit(state.copyWith(
        productListResponse: ApiResponse.error(error.toString()),
      ));
    }
  }

  _resetProductEvent(ResetProductEvent event, Emitter<ProductState> emit) {
    debugPrint("-----??? reset product list");

    emit(
      state.copyWith(
        productListResponse: ApiResponse.init(),
        productList: [],
        currentPage: 0,
        totalPages: 0,
        totalItems: 0,
      ),
    );
  }
}

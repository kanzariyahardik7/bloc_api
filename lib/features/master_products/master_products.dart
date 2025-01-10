import 'package:bloc_api/dependancy_injection/dependancy_injection.dart';
import 'package:bloc_api/features/master_products/bloc/product_bloc.dart';
import 'package:bloc_api/features/master_products/bloc/product_event.dart';
import 'package:bloc_api/features/master_products/bloc/product_state.dart';
import 'package:bloc_api/features/master_products/widget/porduct_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterProducts extends StatefulWidget {
  const MasterProducts({super.key});

  @override
  State<MasterProducts> createState() => _MasterProductsState();
}

class _MasterProductsState extends State<MasterProducts> {
  late ProductBloc productBloc;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      _scrollListener();
    });

    productBloc = BlocProvider.of<ProductBloc>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchProduct();
    });

    super.initState();
  }

  fetchProduct() {
    productBloc.add(ResetProductEvent());
    productBloc.add(ProductFetchEvent(businessid: 26, queryParameters: {
      "page": productBloc.currentPage + 1,
      "limit": productBloc.limit,
    }));
  }

  loadMore() {
    productBloc.add(ProductFetchEvent(businessid: 26, queryParameters: {
      "page": productBloc.currentPage + 1,
      "limit": productBloc.limit,
    }));
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        (scrollController.position.maxScrollExtent)) {
      if (productBloc.currentPage < productBloc.totalPages) {
        loadMore();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    productBloc.add(ResetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Master Products",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.productListResponse.message ?? "")),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadedState) {
              return SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  physics: const ClampingScrollPhysics(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.productList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemBuilder: (context, index) {
                      return PorductItemWidget(
                          productItemData: state.productList[index]);
                    },
                  ));
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}

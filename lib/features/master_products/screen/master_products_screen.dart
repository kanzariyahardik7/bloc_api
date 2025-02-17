import 'package:bloc_api/features/master_products/bloc/product_bloc.dart';
import 'package:bloc_api/features/master_products/bloc/product_event.dart';
import 'package:bloc_api/features/master_products/bloc/product_state.dart';
import 'package:bloc_api/features/master_products/screen/widget/porduct_item_widget.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/universal_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterProductsScreen extends StatefulWidget {
  const MasterProductsScreen({super.key});

  @override
  State<MasterProductsScreen> createState() => _MasterProductsScreenState();
}

class _MasterProductsScreenState extends State<MasterProductsScreen> {
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
      "page": productBloc.state.currentPage! + 1,
      "limit": productBloc.state.limit,
    }));
  }

  loadMore() {
    productBloc.add(ProductFetchEvent(businessid: 26, queryParameters: {
      "page": productBloc.state.currentPage! + 1,
      "limit": productBloc.state.limit,
    }));
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        (scrollController.position.maxScrollExtent)) {
      if (productBloc.state.currentPage! < productBloc.state.totalPages!) {
        loadMore();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
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
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.currentPage == 0 &&
                state.productListResponse?.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (state.productListResponse?.status == Status.completed &&
                  state.productList!.isEmpty) {
                return const NoData();
              } else {
                return SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(12),
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.productList!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemBuilder: (context, index) {
                            return PorductItemWidget(
                                productItemData: state.productList![index]);
                          },
                        ),
                        state.currentPage! < state.totalPages!
                            ? const CircularProgressIndicator()
                            : const SizedBox.shrink(),
                        const SizedBox(height: 80),
                      ],
                    ));
              }
            }
          },
        ));
  }
}

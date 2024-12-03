import 'package:bloc_api/covid/bloc/bloc.dart';
import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/repo/product_repository.dart';
import 'package:bloc_api/routes/app_router.dart';
import 'package:bloc_api/screens/master_products/bloc/product_bloc.dart';
import 'package:bloc_api/services/main_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // final Dio dio = Dio();

  // final NetworkApiService networkApiService = NetworkApiService(dio: dio);
  // final ProductRepository productRepository =
  //     ProductRepository(networkApiService: networkApiService);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => CovidBloc(),
    ),
    BlocProvider(
      create: (context) =>
          ProductBloc(productRepository: MainService.productRepository),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return child!;
      },
      routerConfig: AppRouter.router,
    );
  }
}

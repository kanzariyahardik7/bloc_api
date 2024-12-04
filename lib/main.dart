import 'package:bloc_api/network/network_api_service.dart';
import 'package:bloc_api/repository/product_repository.dart';
import 'package:bloc_api/routes/app_router.dart';
import 'package:bloc_api/screens/master_products/bloc/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final Dio dio = Dio();
  final NetworkApiService networkApiService = NetworkApiService(dio: dio);
  final ProductRepository productRepository =
      ProductRepository(networkApiService: networkApiService);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ProductBloc(productRepository: productRepository),
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

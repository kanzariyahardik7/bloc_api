import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class ProductFetchEvent extends ProductEvent {
  final int businessid;
  final Map<String, dynamic>? queryParameters;

  ProductFetchEvent({required this.businessid, this.queryParameters});
  @override
  List<Object?> get props => [businessid, queryParameters];
}

class ResetProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

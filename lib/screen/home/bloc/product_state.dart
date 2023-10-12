part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> listAllProduct;

  const ProductLoaded({required this.listAllProduct});

  List<Product> get listHotProduct =>
      listAllProduct.where((e) => e.hot == true).toList();

  @override
  List<Object> get props => [listAllProduct];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductEmpty extends ProductState {}

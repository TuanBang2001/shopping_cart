import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/screen/home/repository/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductLoading()) {
    on<ProductGetAll>(_getAllProduct);
  }

  Future<void> _getAllProduct(
      ProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final List<Product> response = await repository.getAllProduct();
      await Future.delayed(const Duration(milliseconds: 2000));
      response.isEmpty
          ? emit(ProductEmpty())
          : emit(ProductLoaded(listAllProduct: response));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/screen/cart/models/Cart.dart';
import 'package:shopping_cart/screen/home/models/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveQuantityProduct>(_onRemoveQuantityProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<RemoveCart>(_onRemoveCart);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..add(event.product)),
        ));
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveQuantityProduct(
      RemoveQuantityProduct event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
          products: List.from((state as CartLoaded).cart.products)
            ..remove(event.product),
        )));
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..removeWhere((element) => element == event.product)),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveCart(RemoveCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..clear())));
      } on Exception {
        emit(CartError());
      }
    }
  }
}

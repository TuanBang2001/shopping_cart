import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/config.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/screen/cart/widgets/widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        title: Text(
          "Cart",
          style: AppTypography.primary.bold24.copyWith(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return _renderUi(context, state);
        },
      ),
    );
  }

  Widget _renderUi(BuildContext context, CartState state) {
    switch (state.runtimeType) {
      case CartLoading:
        return const Center(
          child: CircularProgressIndicator(color: Colors.black),
        );
      case CartLoaded:
        final stateLoaded = state as CartLoaded;
        return _cartLoaded(context, stateLoaded);
      default:
        return const Text('Something went wrong');
    }
  }

  Widget _cartLoaded(BuildContext context, CartLoaded state) {
    return Column(
      children: [
        Expanded(child: ListItemCart(state: state)),
        Order(state: state)
      ],
    );
  }
}

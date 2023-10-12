import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/app_typography.dart';
import 'package:shopping_cart/screen/home/bloc/product_bloc.dart';
import 'package:shopping_cart/screen/home/all_product/widgets/widgets.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              "Món ăn",
              style:
                  AppTypography.primary.bold24.copyWith(color: Colors.orange),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: _renderUi(context, state),
          ),
        ],
      );
    });
  }

  Widget _renderUi(BuildContext context, ProductState state) {
    switch (state.runtimeType) {
      case ProductLoading:
        return const AllProductLoading();
      case ProductLoaded:
        final stateLoaded = state as ProductLoaded;
        return AllProductLoaded(listProduct: stateLoaded.listAllProduct);
      case ProductError:
        final stateError = state as ProductError;
        return AllProductError(message: stateError.message);
      case ProductEmpty:
        return const AllProductEmpty(message: "Món ăn trống!");
      default:
        return const AllProductLoading();
    }
  }
}

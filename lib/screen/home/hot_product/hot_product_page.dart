import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/app_typography.dart';
import 'package:shopping_cart/screen/home/bloc/product_bloc.dart';
import 'package:shopping_cart/screen/home/hot_product/widgets/widgets.dart';

class HotProductPage extends StatefulWidget {
  const HotProductPage({Key? key}) : super(key: key);

  @override
  State<HotProductPage> createState() => _HotProductPageState();
}

class _HotProductPageState extends State<HotProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Row(
              children: [
                Text(
                  "Món ăn nổi bật",
                  style: AppTypography.primary.bold24
                      .copyWith(color: Colors.orange),
                ),
                const Icon(
                  Icons.local_fire_department,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          _renderUi(context, state),
        ],
      );
    });
  }

  Widget _renderUi(BuildContext context, ProductState state) {
    switch (state.runtimeType) {
      case ProductLoading:
        return const HotProductLoading();
      case ProductLoaded:
        final stateLoaded = state as ProductLoaded;
        return HotProductLoaded(listProduct: stateLoaded.listHotProduct);
      case ProductError:
        final stateError = state as ProductError;
        return HotProductError(message: stateError.message);
      case ProductEmpty:
        return const HotProductEmpty(message: "Món ăn nổi bật trống!");
      default:
        return const HotProductLoading();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_cart/ultis/ultis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/config.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';

class ListItemCart extends StatelessWidget {
  final CartLoaded state;

  const ListItemCart({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map cart = state.cart.productQuantity(state.cart.products);

    return ListView.separated(
      itemCount: cart.keys.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Stack(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          cart.keys.elementAt(index).image.toString(),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cart.keys.elementAt(index).title.toString(),
                                  style: AppTypography.primary.bold14
                                      .copyWith(color: Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<CartBloc>().add(RemoveProduct(
                                        cart.keys.elementAt(index)));
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Center(
                                      child: Text(
                                        "x",
                                        style: AppTypography.primary.regular17
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.read<CartBloc>().add(
                                              RemoveQuantityProduct(
                                                  cart.keys.elementAt(index)));
                                        },
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style: AppTypography
                                                  .primary.regular17
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  color: Colors.grey)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            cart.values
                                                .elementAt(index)
                                                .toString(),
                                            style: AppTypography
                                                .primary.regular17
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<CartBloc>().add(
                                              AddProduct(
                                                  cart.keys.elementAt(index)));
                                        },
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style: AppTypography
                                                  .primary.regular17
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                    FormatNumber.formatPrice(
                                        cart.keys.elementAt(index).price *
                                            cart.values.elementAt(index)),
                                    style: AppTypography.primary.regular17
                                        .copyWith(color: Colors.orange))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

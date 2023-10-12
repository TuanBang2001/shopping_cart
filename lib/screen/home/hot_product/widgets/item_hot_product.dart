import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/ultis/ultis.dart';
import 'package:shopping_cart/config/app_typography.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/screen/product_detail/product_detail_page.dart';

class ItemHotProduct extends StatelessWidget {
  final Product product;

  const ItemHotProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: context.read<CartBloc>(),
                  child: ProductDetailPage(product: product),
                )));
      },
      child: Container(
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
            width: 150,
            height: 250,
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset(product.image.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title.toString(),
                                style: AppTypography.primary.bold14
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(FormatNumber.formatPrice(product.price),
                                  style: AppTypography.primary.regular17
                                      .copyWith(color: Colors.orange))
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              context.read<CartBloc>().add(AddProduct(product));
                            },
                            child: const Icon(
                              Icons.add_shopping_cart,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

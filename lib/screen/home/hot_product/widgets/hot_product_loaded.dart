import 'package:flutter/material.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/screen/home/hot_product/widgets/item_hot_product.dart';

class HotProductLoaded extends StatelessWidget {
  final List<Product> listProduct;

  const HotProductLoaded({Key? key, required this.listProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: listProduct.length,
        itemBuilder: (_, index) => ItemHotProduct(product: listProduct[index]),
      ),
    );
  }
}

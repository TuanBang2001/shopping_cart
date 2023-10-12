import 'package:flutter/material.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/screen/home/all_product/widgets/item_all_product.dart';

class AllProductLoaded extends StatelessWidget {
  final List<Product> listProduct;

  const AllProductLoaded({Key? key, required this.listProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          return ItemAllProduct(
            product: listProduct[index],
          );
        });
  }
}

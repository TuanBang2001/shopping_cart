import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/config.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/screen/cart/cart_page.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/ultis/ultis.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(product.title.toString(),
            style: AppTypography.primary.bold24.copyWith(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              product.image.toString(),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
                FormatNumber.formatPrice(product.price),
                style: AppTypography.primary.regular17
                    .copyWith(color: Colors.orange)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              product.description.toString(),
                style: AppTypography.primary.regular17
            ),
          ),
          const Spacer(),
          _btnAddToCart(context),
        ],
      ),
    );
  }

  Widget _btnAddToCart(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartBloc>().add(AddProduct(product));
          _showAlertDialog(context);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 15.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Thêm vào giỏ hàng',
            style: AppTypography.primary.bold24.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext _) => Dialog(
        elevation: 0,
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Thêm vào giỏ hàng thành công",
                style:
                    AppTypography.primary.bold24.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Ok',
                      style: AppTypography.primary.bold24
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

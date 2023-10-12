import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/config.dart';
import 'package:shopping_cart/screen/home/home_page.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';

class Order extends StatelessWidget {
  final CartLoaded state;

  const Order({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map cart = state.cart.productQuantity(state.cart.products);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng tiền",
                  style: AppTypography.primary.regular17
                      .copyWith(color: Colors.black)),
              Text(state.cart.totalString,
                  style: AppTypography.primary.regular17
                      .copyWith(color: Colors.black))
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                cart.keys.isNotEmpty ? _showAlertDialog(context) : null;
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
                  'Đặt hàng',
                  style: AppTypography.primary.bold24
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
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
                "Đặt hàng thành công",
                style:
                    AppTypography.primary.bold24.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveCart());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value: context.read<CartBloc>(),
                              child: const HomePage(),
                            )));
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
                      'Trở về trang chủ',
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

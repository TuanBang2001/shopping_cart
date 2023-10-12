import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/config/config.dart';
import 'package:shopping_cart/screen/home/home_page.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: context.read<CartBloc>(),
                  child: const HomePage(),
                )));
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                AppImages.cart,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

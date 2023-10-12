import 'package:flutter/material.dart';
import 'package:shopping_cart/config/config.dart';

class HotProductError extends StatelessWidget {
  final String message;

  const HotProductError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: Text(
          message,
          style: AppTypography.primary.bold14.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

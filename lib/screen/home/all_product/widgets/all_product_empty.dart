import 'package:flutter/material.dart';
import 'package:shopping_cart/config/config.dart';

class AllProductEmpty extends StatelessWidget {
  final String message;

  const AllProductEmpty({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTypography.primary.bold14.copyWith(color: Colors.black),
      ),
    );
  }
}

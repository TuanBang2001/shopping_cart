import 'package:equatable/equatable.dart';
import 'package:shopping_cart/screen/home/models/product.dart';
import 'package:shopping_cart/ultis/ultis.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get total => products.fold(
      0, (total, current) => total + double.parse(current.price.toString()));

  String get totalString => FormatNumber.formatPrice(total);
}

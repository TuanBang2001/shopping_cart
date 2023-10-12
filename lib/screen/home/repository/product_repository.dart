import 'package:shopping_cart/data/data.dart';
import 'package:shopping_cart/screen/home/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProduct();
}

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<Product>> getAllProduct() async {
    try {
      final List<Product> listProduct =
          listFoods.map((data) => Product.fromJson(data)).toList();
      return listProduct;
    } catch (e) {
      rethrow;
    }
  }
}

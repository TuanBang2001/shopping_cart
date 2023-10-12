import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/screen/cart/cart_page.dart';
import 'package:shopping_cart/config/app_typography.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/screen/home/bloc/product_bloc.dart';
import 'package:shopping_cart/screen/home/hot_product/hot_product_page.dart';
import 'package:shopping_cart/screen/home/all_product/all_product_page.dart';
import 'package:shopping_cart/screen/home/repository/product_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Home",
            style: AppTypography.primary.bold24.copyWith(color: Colors.white),
          ),
          actions: [_iconCart()],
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ProductBloc>(
              create: (_) => ProductBloc(repository: ProductRepositoryImpl())
                ..add(ProductGetAll()),
            )
          ],
          child: _body(),
        ),
      ),
    );
  }

  Widget _iconCart() {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<CartBloc>(),
                    child: const CartPage(),
                  )));
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartLoaded:
                final stateLoaded = state as CartLoaded;
                Map cart =
                    stateLoaded.cart.productQuantity(stateLoaded.cart.products);

                return Center(
                  child: cart.keys.isEmpty
                      ? const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        )
                      : Stack(
                          children: [
                            const Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    cart.keys.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                );
              default:
                return const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                );
            }
          },
        ),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(ProductGetAll());
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              HotProductPage(),
              AllProductPage(),
            ],
          ),
        ),
      );
    });
  }
}

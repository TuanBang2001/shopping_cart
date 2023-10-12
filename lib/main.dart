import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/screen/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/screen/intro/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (_) => CartBloc()..add(LoadCart()))
        ],
        child: IntroPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_cart_application/pages/checkout.dart';
import 'package:shopping_cart_application/pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/checkout': (context) => const Checkout()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

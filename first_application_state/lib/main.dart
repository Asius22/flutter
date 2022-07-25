import 'dart:developer';

import 'package:first_application_state/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 *
 * INCOMPLETO!!!!!!!!!
 */
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello world app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hrllo world!"),
          actions: [
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return IconButton(
                    tooltip: "${cart.items.length}",
                    onPressed: () => log("${cart.totalPrice}"),
                    icon: Icon(
                      Icons.shopping_cart,
                      semanticLabel: "${cart.items.length}",
                    ));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () => Provider.of<CartModel>(context, listen: false)
                    .add(Item(price: 5)),
                child: const Text("Aggiungi"),
              ),
              Consumer<CartModel>(builder: ((context, cart, child) {
                return Column(
                  children: [
                    Text("${cart.items.length}"),
                    if (child != null) child
                  ],
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}

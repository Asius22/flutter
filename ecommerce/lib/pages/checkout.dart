import 'package:ecommerce/Blocs/bloc/cart_bloc.dart';
import 'package:ecommerce/view/cart_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const String routeName = "/checkout";

  @override
  Widget build(BuildContext context) {
    //final totalPrice = BlocProvider.of<CartBloc>(context).state.cart.totalPrice.toStr;
    return Scaffold(
      appBar: AppBar(title: const Text("checkout")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => state.cart.isEmptyCart
            ? const EmptyCartWidget()
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cart.lenght,
                      itemBuilder: (context, index) =>
                          CartTile(cartItem: state.cart.getAtIndex(index)),
                    ),
                  ),
                  Container(
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                  "Prezzo totale: ${BlocProvider.of<CartBloc>(context).state.cart.totalPrice.toStringAsFixed(2)}")),
                          ElevatedButton(
                              onPressed: () =>
                                  BlocProvider.of<CartBloc>(context)
                                      .add(CheckoutEvent()),
                              child: Text("checkout".toUpperCase()))
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nessun oggetto nel carrello"),
            OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Torna indietro"))
          ],
        ),
      );
}

import 'package:ecommerce/Blocs/bloc/cart_bloc.dart';
import 'package:ecommerce/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key, required this.cartItem}) : super(key: key);
  final Item cartItem;
  static const TextStyle _smallBoldText =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const TextStyle _smallText = TextStyle(fontSize: 10);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  cartItem.image,
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.title,
                        style: _smallBoldText,
                      ),
                      Text(
                        "${cartItem.price}",
                        style: _smallText,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        iconSize: 8,
                        padding: const EdgeInsets.all(2),
                        splashRadius: 8,
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context).add(
                              RemoveOneOccursFromCartEvent(item: cartItem));
                        },
                        icon: const Icon(
                          Icons.remove,
                        )),
                    Text(
                      "${cartItem.qnt}",
                    ),
                    IconButton(
                        iconSize: 8,
                        padding: const EdgeInsets.all(2),
                        splashRadius: 8,
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(AddCartEvent(item: cartItem));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 10,
                        )),
                  ],
                ),
                IconButton(
                    splashRadius: 12,
                    iconSize: 16,
                    padding: const EdgeInsets.all(2),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveFromCartEvent(item: cartItem));
                    },
                    icon: const Icon(
                      Icons.clear_outlined,
                      color: Colors.red,
                    )),
              ]),
        ),
      );
}

import 'package:ecommerce/Blocs/bloc/cart_bloc.dart';
import 'package:ecommerce/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<CartBloc>(context);
    return Card(
      margin: const EdgeInsets.all(8),
      borderOnForeground: true,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              item.image,
              height: 100,
              width: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Text(
              "${item.price} €",
              style: const TextStyle(fontSize: 12),
            ),
            _rateRow(item.rating),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                provider.add(AddCartEvent(item: item));
              },
              child: const Text("aggiungi al carrello"),
            )
          ],
        ),
      ),
    );
  }

  Widget _rateRow(Rating rating) {
    Row row = Row(
      children: [
        Expanded(
          child: Text(
            "count: ${rating.count}",
            style: const TextStyle(fontSize: 10),
          ),
        )
      ],
    );
    var intRate = rating.rate.toInt();
    for (var i = 0; i < intRate; i++) {
      row.children.add(const Icon(
        Icons.star,
        color: Colors.orange,
        size: 15,
      ));
    }
    if (rating.rate > intRate) {
      row.children.add(const Icon(
        Icons.star_half,
        color: Colors.orange,
        size: 15,
      ));
    }
    return row;
  }
}

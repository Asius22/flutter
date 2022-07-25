import 'package:ecommerce/Blocs/bloc/shopping_list_bloc.dart';
import 'package:ecommerce/components/shopping_list_repository.dart';
import 'package:ecommerce/pages/pages.dart';
import 'package:ecommerce/view/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ListItemPage extends StatelessWidget {
  const ListItemPage({Key? key}) : super(key: key);
  static const String routeName = "/itemList";
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce list"),
        actions: [_cartButton(context)],
      ),
      body: _createProvider(context));

  Widget _cartButton(BuildContext context) => IconButton(
      onPressed: () => Navigator.pushNamed(context, CheckoutPage.routeName),
      icon: const Icon(Icons.shopping_cart));

  Widget _createProvider(BuildContext context) => BlocProvider(
        create: (context) =>
            ShoppingListBloc(ShoppingListRepository(http.Client())),
        child: BlocBuilder<ShoppingListBloc, ShoppingListState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.init:
                BlocProvider.of<ShoppingListBloc>(context)
                    .add(ShoppingListInitEvent());
                return _loadingWidget();
              case Status.loading:
                return _loadingWidget();
              case Status.error:
                return _error("c'è stato un errore");
              default:
                return _createGrid(context, state);
            }
          },
        ),
      );
  Widget _error(String message) => const Center();

  Widget _loadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _createGrid(BuildContext context, ShoppingListState state) =>
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, mainAxisExtent: 250),
        itemCount: state.shoppingList.length,
        itemBuilder: (context, index) => ShoppingCard(
          item: state.shoppingList[index],
        ),
      );
}

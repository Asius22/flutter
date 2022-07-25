import 'dart:convert';
import 'package:ecommerce/components/shopping_list_repository.dart';
import 'package:ecommerce/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final ShoppingListRepository repository;
  ShoppingListBloc(this.repository) : super(ShoppingListInitial()) {
    on<ShoppingListInitEvent>((event, emit) async {
      emit(ShoppingListLoading());

      try {
        final data = await repository.fetchData();
        final list = await jsonDecode(data)
            .map<Item>((json) => Item.fromJson(json))
            .toList();

        emit(ShoppingListLoaded(shoppingList: [...list]));
      } catch (e) {
        emit(ShoppingListError(message: "ciao : $e"));
      }
    });
  }
}

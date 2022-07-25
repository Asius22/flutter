part of 'shopping_list_bloc.dart';

enum Status { init, loading, loaded, error }

abstract class ShoppingListState extends Equatable {
  abstract final Status status;
  abstract final List<Item> shoppingList;
  @override
  List<Object> get props => [status];
}

class ShoppingListInitial extends ShoppingListState {
  @override
  Status get status => Status.init;

  @override
  List<Item> get shoppingList => [];
}

class ShoppingListLoading extends ShoppingListState {
  @override
  Status get status => Status.loading;

  @override
  List<Item> get shoppingList => [];
}

class ShoppingListLoaded extends ShoppingListState {
  ShoppingListLoaded({required this.shoppingList});

  @override
  Status get status => Status.loaded;

  @override
  final List<Item> shoppingList;

  @override
  List<Object> get props => [shoppingList];
}

class ShoppingListError extends ShoppingListState {
  final String message;
  ShoppingListError({this.message = ""});

  @override
  List<Object> get props => [message];

  @override
  List<Item> get shoppingList => [];

  @override
  Status get status => Status.error;
}

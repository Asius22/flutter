part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ShoppingCartInitial extends ShoppingCartState {}

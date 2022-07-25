part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCartEvent extends CartEvent {
  const AddCartEvent({required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class AddNewItemEvent extends CartEvent {
  const AddNewItemEvent({required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveOneOccursFromCartEvent extends CartEvent {
  const RemoveOneOccursFromCartEvent({required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveFromCartEvent extends CartEvent {
  const RemoveFromCartEvent({required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class CheckoutEvent extends CartEvent {}

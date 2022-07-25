part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({required this.cart});
  final Cart cart;

  @override
  List<Object> get props => [cart];

  CartState copyWith(Cart? cart) => CartState(cart: cart ?? this.cart);
}

class CartErrorState extends CartState {
  const CartErrorState({required this.message})
      : super(cart: const Cart(list: []));
  final String message;
}

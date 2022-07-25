import 'dart:developer';

import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(cart: Cart(list: []))) {
    on<AddCartEvent>((event, emit) {
      try {
        emit(state.copyWith(state.cart.add(event.item)));
      } catch (e) {
        emit(CartErrorState(message: e.toString()));
      }
    });

    on<RemoveOneOccursFromCartEvent>((event, emit) {
      try {
        emit(state.copyWith(state.cart.remove(event.item)));
      } catch (e) {
        emit(CartErrorState(message: e.toString()));
      }
    });

    on<RemoveFromCartEvent>((event, emit) {
      try {
        emit(state.copyWith(state.cart.delete(event.item)));
      } catch (e) {
        emit(CartErrorState(message: e.toString()));
      }
    });

    on<CheckoutEvent>((event, emit) {
      try {
        emit(const CartState(cart: Cart(list: [])));
      } catch (e) {
        emit(CartErrorState(message: e.toString()));
      }
    });
  }
}

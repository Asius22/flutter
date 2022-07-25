import 'package:ecommerce/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({required this.list});
  final List<Item> list;

  Item getAtIndex(int index) => list[index];

  bool contains(Item item) => list.contains(item);

  int get lenght => list.length;

  bool get isEmptyCart => list.isEmpty;

  double get totalPrice =>
      list.fold(0.0, (total, item) => total += item.totalPrice);

  Cart add(Item item) {
    final index = list.indexOf(item);
    var newList = [...list];
    if (index != -1) {
      newList
        ..remove(item)
        ..insert(index, item.itemAddedd());

      return copyWith([...newList]);
    }
    return copyWith([...newList, item.itemAddedd()]);
  }

  ///if element has many occurs of itslef in the cart the qnt value will be decremented
  ///if qnt will be equal to zero then the element will be deleted from the cart
  Cart remove(Item item) {
    final index = list.indexOf(item);
    if (index != -1) {
      var newList = [...list]
        ..remove(item)
        ..insert(index, item.itemRemoved());
      return (newList.elementAt(index).qnt != 0)
          ? copyWith([...newList])
          : delete(item);
    }
    return this;
  }

  ///delete the element getted through input also if it has many occurs of itself in the cart
  Cart delete(Item item) {
    return copyWith([...list]..remove(item));
  }

  @override
  List<Object?> get props => [list];

  Cart copyWith(List<Item>? cart) => Cart(list: cart ?? list);
}

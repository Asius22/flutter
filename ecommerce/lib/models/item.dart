import "package:equatable/equatable.dart";

class Item extends Equatable {
  const Item(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.rating,
      this.qnt = 0});
  final int id;
  final String image, title;
  final double price;
  final Rating rating;
  final int qnt;
  @override
  List<Object?> get props => [id, image, title, price, rating, qnt];

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      price: json["price"] + 0.0,
      rating: Rating.fromJson(json["rating"]));

  Item copyWith(
          {int? id,
          String? image,
          String? title,
          double? price,
          Rating? rating,
          int? qnt}) =>
      Item(
          id: id ?? this.id,
          image: image ?? this.image,
          title: title ?? this.title,
          price: price ?? this.price,
          rating: rating ?? this.rating,
          qnt: qnt ?? this.qnt);

  Item itemAddedd() => copyWith(qnt: qnt + 1);

  Item itemRemoved() => copyWith(qnt: qnt - 1);

  double get totalPrice => (qnt * price).toDouble();
}

class Rating extends Equatable {
  const Rating({required this.count, required this.rate});

  final int count;
  final double rate;

  @override
  List<Object?> get props => [count, rate];
  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(count: json["count"], rate: json["rate"] + 0.0);
}

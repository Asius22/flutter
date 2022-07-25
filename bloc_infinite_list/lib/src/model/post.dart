import 'package:equatable/equatable.dart';

class Post extends Equatable {
  Post(
      {required this.id,
      required this.userId,
      required this.body,
      required this.title});

  final int userId;
  final int id;
  final String body;
  final String title;

  @override
  List<Object?> get props => [userId, id, body, title];

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      userId: json['userId'],
      body: json['body'],
      title: json['title']);
}

import 'package:equatable/equatable.dart';

class Todos extends Equatable {
  const Todos({required this.id, required this.title, required this.completed});

  final int id;
  final bool completed;
  final String title;

  factory Todos.fromJson(Map<String, dynamic> json) =>
      Todos(id: json['id'], title: json['title'], completed: json['completed']);

  @override
  List<Object?> get props => [id, title, completed];
}

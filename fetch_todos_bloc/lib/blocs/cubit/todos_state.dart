part of 'todos_cubit.dart';

enum Status { init, loading, loaded, error }

class TodosState extends Equatable {
  const TodosState({this.todos = const [], required this.status});
  final List<Todos> todos;
  final Status status;
  @override
  List<Object?> get props => [todos, status];

  TodosState copyWith({List<Todos>? todos, Status? status}) =>
      TodosState(todos: todos ?? this.todos, status: status ?? this.status);
}

class TodosError extends TodosState {
  const TodosError(this.message) : super(status: Status.error);
  final String message;

  @override
  List<Object?> get props => [message];
}

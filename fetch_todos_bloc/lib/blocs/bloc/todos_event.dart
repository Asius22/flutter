part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoadEvent extends TodosEvent {}

class TodosChangedEvent extends TodosEvent {
  const TodosChangedEvent({required this.todo});

  final Todos todo;

  @override
  List<Object> get props => [todo];
}

import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:fetch_todos_bloc/models/fetcher.dart';
import 'package:fetch_todos_bloc/models/todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final Fetcher fetcher;
  TodosBloc({required this.fetcher})
      : super(const TodosState(status: Status.init)) {
    on<TodosLoadEvent>(_loadCalled);
    on<TodosChangedEvent>(_changeCalled);
  }

  void _loadCalled(TodosLoadEvent event, Emitter<TodosState> emit) async {
    emit(const TodosState(status: Status.loading));

    try {
      String json = await fetcher.fetchData();
      final result = await jsonDecode(json)
          .map<Todos>((json) => Todos.fromJson(json))
          .toList();

      emit(TodosState(todos: [...result], status: Status.loaded));
    } catch (e) {
      emit(const TodosError("something went wrong during todos fetching"));
    }
  }

  void _changeCalled(TodosChangedEvent event, Emitter<TodosState> emit) {
    var index = state.todos.indexOf(event.todo);

    try {
      emit(state.copyWith(
          todos: [...state.todos]
            ..remove(event.todo)
            ..insert(
                index,
                Todos(
                    id: event.todo.id,
                    title: event.todo.title,
                    completed: !event.todo.completed))));
    } catch (e) {
      log(e.toString());
    }
  }
}
